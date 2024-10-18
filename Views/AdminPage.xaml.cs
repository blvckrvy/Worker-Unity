namespace Worker_Unity.Views;

public partial class AdminPage : ContentPage
{
	public AdminPage()
	{
		InitializeComponent();

		//this will eventually fetch from database
		workerPicker.ItemsSource = new List<string> { "Ryan", "Reynard", "Tyrone", "Tsholofelo" }; //placeholder data
	}

	private async void Back_btn_clicked(object sender, EventArgs e)
	{
		bool confirm = await DisplayAlert("Log Out", "Are you sure you want to log out?", "Yes", "No");
		if (confirm)
		{
			await Navigation.PopToRootAsync();
		}
	}

    //handle task assignment button
    private async void Assign_btn_clicked(object sender, EventArgs e)
	{
		string? selectedWorker = workerPicker.SelectedItem?.ToString();
		string taskDescription = taskDescriptionEditor.Text;
		DateTime dueDate = duedatePicker.Date;

		if (string.IsNullOrEmpty(selectedWorker) || string.IsNullOrEmpty(taskDescription))
		{
			await DisplayAlert("Error", "Please select a worker and enter a task description.", "OK");
			return;
		}

		//simulating task saved to database
		await DisplayAlert("Task Assigned", $"Task for {selectedWorker} has been assigned.\n\n" +
			$"Due Date: {dueDate.ToShortDateString()}", "OK");

		//clear fields after task assignment
		workerPicker.SelectedItem = null;
        taskDescriptionEditor.Text = string.Empty;
		duedatePicker.Date = DateTime.Today;
	}

	//handle file upload (Placeholder for now)
	private async void Uploadfile_btn_clicked(Object sender, EventArgs e)
	{
		//placeholder for file upload logic
		await DisplayAlert("Upload", "File upload feature will be implemented later.", "OK");
	}
}