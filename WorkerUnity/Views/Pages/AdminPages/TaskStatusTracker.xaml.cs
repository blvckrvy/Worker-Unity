namespace WorkerUnity.Views.Pages.AdminPages;

public partial class TaskStatusTracker : ContentPage
{
	public ObservableCollection<StatusItems> Status { get; set; } = [];

    public TaskStatusTracker()
	{
		InitializeComponent();
		BindingContext = this;
		Status = LoadAssignedTask();
        UpdateTaskVisibility();
    }

	public ObservableCollection<StatusItems> LoadAssignedTask()
	{
		var allTasks = App.RealmInstance?.All<StatusTable>()
			.ToList();

		if (allTasks != null && allTasks.Count == 0)
			return [];

		var tasks = allTasks?
			.Select(MapToStatusItems)
			.ToList();

		return new ObservableCollection<StatusItems>(tasks!);
	}

	private StatusItems MapToStatusItems(StatusTable taskAssigned)
	{
		return new StatusItems
        {
			StatusId = taskAssigned.StatusID,
			TaskName = taskAssigned.StatusName,
			TaskDescription = taskAssigned.StatusDescription,
			TaskDueDate = taskAssigned.StatusDueDate,
			TaskProgress = taskAssigned.StatusProgress,
			TaskProgressColor = taskAssigned.StatusColor,
			TaskReason = taskAssigned.TaskDeclineReason,
			ShowReason = taskAssigned.showReason,
			WorkerName = taskAssigned.Workers ?? []
		};
	}

    private void UpdateTaskVisibility()
    {
        if (Status != null && Status.Count > 0)
        {
            NoTasksLayout.IsVisible = false;
            TaskListView.IsVisible = true;
            TaskListView.ItemsSource = Status;
        }
        else
        {
            NoTasksLayout.IsVisible = true;
            TaskListView.IsVisible = false;
        }
    }
}