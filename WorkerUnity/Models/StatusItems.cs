namespace WorkerUnity.Models;

public class StatusItems : INotifyPropertyChanged
{
    public ObjectId StatusId { get; set; }
    public string? _taskName { get; set; }
    public string? _taskDesc { get; set; }
    public DateTimeOffset _taskDueDate { get; set; }
    public string? _taskProgress { get; set; }
    public string? _taskColor { get; set; }
    public string? _taskReason { get; set; }
    public bool _showReason { get; set; }
    public IList<UserTable>? _workerName {  get; set; }


    public string? TaskName
    {
        get => _taskName;
        set { _taskName = value; OnPropertyChanged(nameof(TaskName)); }
    }

    public string? TaskDescription
    {
        get => _taskDesc;
        set { _taskDesc = value; OnPropertyChanged(nameof(TaskDescription)); }
    }
    public DateTimeOffset TaskDueDate
    {
        get => _taskDueDate;
        set { _taskDueDate = value; OnPropertyChanged(nameof(TaskDueDate)); }
    }
    public string? TaskProgress
    {
        get => _taskProgress;
        set { _taskProgress = value; OnPropertyChanged(nameof(TaskProgress)); }
    }
    public string? TaskProgressColor
    {
        get => _taskColor;
        set { _taskColor = value; OnPropertyChanged(nameof(TaskProgressColor)); }
    }
    public string? TaskReason
    {
        get => _taskReason;
        set { _taskReason = value; OnPropertyChanged(nameof(TaskReason)); }
    }

    public bool ShowReason
    {
        get => _showReason;
        set { _showReason = value; OnPropertyChanged(nameof(ShowReason)); }
    }

    public IList<UserTable>? WorkerName
    {
        get => _workerName;
        set { _workerName = value; OnPropertyChanged(nameof(WorkerName)); }
    }

    public string WorkerNameDisplay
    {
        get => WorkerName != null
            ? string.Join(", ", WorkerName.
                Select(worker => $"{worker.FirstName} {worker.LastName}"))
            : "No Workers assigned";
    }

    public event PropertyChangedEventHandler? PropertyChanged;
    protected void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
