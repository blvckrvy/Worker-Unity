namespace WorkerUnity.Views.Pages.AdminPages;

public partial class AdminArchivesPage : ContentPage
{
	public ObservableCollection<ArchivedItems> Archives { get; set; } = [];

	public AdminArchivesPage()
	{
		InitializeComponent();
		BindingContext = this;
		Archives = LoadArchivedTasks();
		UpdateTaskVisibility();

    }

	public ObservableCollection<ArchivedItems> LoadArchivedTasks()
	{
		var allArchivedTasks = App.RealmInstance?.All<ArchiveTable>()
			.ToList();

		if (allArchivedTasks != null && allArchivedTasks.Count == 0)
			return [];

        var archivedItems = allArchivedTasks?
			.Select(MapToArchivedItems)
			.ToList();

		return new ObservableCollection<ArchivedItems>(archivedItems!);
	}

	private ArchivedItems MapToArchivedItems(ArchiveTable taskArchived)
	{
		return new ArchivedItems
		{
			ArchivedId = taskArchived.ArchiveID,
			ArchivedTaskName = taskArchived.ArchiveName,
			ArchivedTaskDescription = taskArchived.ArchiveDescription,
			ArchivedTaskDueDate = taskArchived.ArchiveDueDate,
			ArchivedTaskCondition = taskArchived.ArchiveCondition,
            WorkerName = taskArchived.Workers ?? []
        };
	}

	private void UpdateTaskVisibility()
	{
        if (Archives != null && Archives.Count > 0)
        {
            NoTasksLayout.IsVisible = false;
            TaskListView.IsVisible = true;
            TaskListView.ItemsSource = Archives;
        }
        else
        {
            NoTasksLayout.IsVisible = true;
            TaskListView.IsVisible = false;
        }
    }

    private void OnDeleteClicked(object sender, EventArgs e)
	{
		//update ui
		var task = (ArchivedItems)((Button)sender).CommandParameter;
		Archives.Remove(task);
		UpdateTaskVisibility();

		//update database
		var taskToDelete = App.RealmInstance?.Find<ArchiveTable>(task.ArchivedId);
		if (taskToDelete != null)
		{
			App.RealmInstance?.Write(() =>
			{
				App.RealmInstance.Remove(taskToDelete);
			});
		}
    }
}