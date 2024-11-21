using System.Threading.Tasks;

namespace WorkerUnity.Views.Pages.WorkerPages;

public partial class ArchivesPage : ContentPage
{
    public ObservableCollection<ArchivedItems> Archives { get; set; } = [];

    public ArchivesPage()
	{
		InitializeComponent();
        BindingContext = this;
        Archives = LoadArchivedTasks();
        LoadTasks();
    }

    public ObservableCollection<ArchivedItems> LoadArchivedTasks()
    {
        var currentWorkerId = Preferences.Get("CurrentUserId", string.Empty);
        if (string.IsNullOrEmpty(currentWorkerId))
            return [];

        var allArchivedTasks = App.RealmInstance?.All<ArchiveTable>()
            .ToList();

        if (allArchivedTasks == null || allArchivedTasks.Count == 0)
            return [];

        var filteredArchivedTasks = allArchivedTasks
            .Where(a => a.Workers != null
                               && a.Workers.Any(w => w.UserID.ToString() == currentWorkerId))
            .ToList();

        var archivedItems = filteredArchivedTasks
            .Select(MapToArchivedItems)
            .ToList();

        return new ObservableCollection<ArchivedItems>(archivedItems);
    }

    private ArchivedItems MapToArchivedItems(ArchiveTable taskArchived)
    {
        return new ArchivedItems
        {
            ArchivedId = taskArchived.ArchiveID,
            ArchivedTaskName = taskArchived.ArchiveName,
            ArchivedTaskDescription = taskArchived.ArchiveDescription,
            ArchivedTaskDueDate = taskArchived.ArchiveDueDate,
            ArchivedTaskCondition = taskArchived.ArchiveCondition
        };
    }

    private void LoadTasks()
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
}