using Microsoft.VisualBasic;
using System.Threading.Tasks;

namespace WorkerUnity.Views.Pages.AdminPages;

public partial class TaskAssignment : ContentPage
{
	public ObservableCollection<UserTable> Workers { get; set; } = [];

    public TaskAssignment()
    {
        InitializeComponent();
        BindingContext = this;
        LoadWorkers();
    }

    //retrieve from database
    private void LoadWorkers()
	{
		var workerList = App.RealmInstance?.All<UserTable>()
			.Where(u => u.Role == "Worker")
			.ToList();

		if (workerList != null)
		{
			Workers = new ObservableCollection<UserTable>(workerList);
            workerPicker.ItemsSource = Workers;
            workerPicker.ItemDisplayBinding = new Binding("LastName");
        }
	}

	private async void OnAssignClicked(object sender, EventArgs e)
	{
        var selectedWorker = workerPicker.SelectedItem as UserTable;
        var taskDescription = taskDescriptionEditor.Text;
		var taskName = taskNameEntry.Text;
		DateTime dueDate = duedatePicker.Date;

		if (selectedWorker == null)
		{
			await DisplayAlert("Error", "Please select a worker", "OK");
			return;
		}

		if (string.IsNullOrEmpty(taskName) || string.IsNullOrEmpty(taskDescription))
		{
            await DisplayAlert("Error", "Please provide a task name and some instructions", "OK");
            return;
        }

        // Assign the task to the selected worker
        

        bool confirmation = await DisplayAlert("Task Assigned", 
			$"Task for {selectedWorker.FirstName} {selectedWorker.LastName} has been assigned.\n\n" +
			$"Due Date: {dueDate.ToShortDateString()}", "OK", "Cancel");

		if (confirmation)
		{
            AssignTaskToWorker(selectedWorker.UserID, taskName, taskDescription, dueDate);

            workerPicker.SelectedItem = null;
            taskDescriptionEditor.Text = string.Empty;
            taskNameEntry.Text = string.Empty;
            duedatePicker.Date = DateTime.Today;
        }
    }

	private void AssignTaskToWorker(ObjectId workerId, string name, string description, DateTime dueDate)
	{
		var sharedTaskIdentifier = Guid.NewGuid().ToString();

		App.RealmInstance?.Write(() =>
		{
			var worker = App.RealmInstance.Find<UserTable>(workerId);
			if (worker == null) return;

			var taskAssignment = new TaskAssignmentTable
			{
				TaskAssignmentID = ObjectId.GenerateNewId(),
				SharedTaskIdentifier = sharedTaskIdentifier,
                TaskAssignmentName = name,
				TaskAssignmentProgress = "Not Started",
				TaskStatusColor = "Grey",
				TaskAcceptButton = true,
				TaskDeclineButton = true,
				TaskStartButton = false,
				TaskCompletedButton = false,
				TaskArchiveButton = false,
				TaskAssignmentDescription = description,
				DueDate = dueDate.AddDays(1),
			};
            taskAssignment.Workers?.Add(worker!);
			App.RealmInstance.Add(taskAssignment);
        });

        //add to the status table
        App.RealmInstance?.Write(() =>
        {
            var worker = App.RealmInstance.Find<UserTable>(workerId);
            if (worker == null) return;

			var status = new StatusTable
			{
				StatusID = ObjectId.GenerateNewId(),
                SharedTaskIdentifier = sharedTaskIdentifier,
                StatusName = name,
				StatusDescription = description,
				StatusDueDate = dueDate.AddDays(1),
				StatusProgress = "Not Started",
				StatusColor = "Grey",
				TaskDeclineReason = "N/A",
				showReason = false
			};
            status.Workers?.Add(worker);
            App.RealmInstance?.Add(status);
        });
    }

	private async void OnArchivesClicked(object sender, EventArgs e)
	{
		await Navigation.PushAsync(new AdminArchivesPage());
	}
}