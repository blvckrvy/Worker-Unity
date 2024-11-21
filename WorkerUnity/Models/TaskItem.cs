namespace WorkerUnity.Models;

public class TaskItem : INotifyPropertyChanged
{
    public ObjectId TaskId { get; set; }
    public string? _taskName { get; set; }
    public string? _taskDescription { get; set; }
    public string? _taskProgress { get; set; }
    public string? _statusColor { get; set; }
    public bool _canAccept { get; set; } = true;
    public bool _canDecline { get; set; } = true;
    public bool _canStart { get; set; } = false;
    public bool _canComplete { get; set; } = false;
    public bool _canArchive { get; set; } = false;
    public string? _taskReason { get; set; }

    public DateTimeOffset _taskDueDate { get; set; }

    public string? TaskName
    {
        get => _taskName;
        set { _taskName = value; OnPropertyChanged(nameof(TaskName)); }
    }

    public string? TaskDescription
    {
        get => _taskDescription;
        set { _taskDescription = value; OnPropertyChanged(nameof(TaskDescription)); }
    }

    public string? TaskProgress
    {
        get => _taskProgress;
        set { _taskProgress = value; OnPropertyChanged(nameof(TaskProgress)); }
    }

    public string? StatusColor
    {
        get => _statusColor;
        set { _statusColor = value; OnPropertyChanged(nameof(StatusColor)); }
    }

    public bool CanAccept
    {
        get => _canAccept;
        set { _canAccept = value; OnPropertyChanged(nameof(CanAccept)); }
    }

    public bool CanDecline
    {
        get => _canDecline;
        set { _canDecline = value; OnPropertyChanged(nameof(CanDecline)); }
    }

    public bool CanStart
    {
        get => _canStart;
        set { _canStart = value; OnPropertyChanged(nameof(CanStart)); }
    }

    public bool CanComplete
    {
        get => _canComplete;
        set { _canComplete = value; OnPropertyChanged(nameof(CanComplete)); }
    }

    public bool CanArchive
    {
        get => _canArchive;
        set { _canArchive = value; OnPropertyChanged(nameof(CanArchive)); }
    }

    public string? TaskReason
    {
        get => _taskReason;
        set { _taskReason = value; OnPropertyChanged(nameof(TaskReason)); }
    }

    public DateTimeOffset TaskDueDate
    {
        get => _taskDueDate;
        set { _taskDueDate = value; OnPropertyChanged(nameof(TaskDueDate)); }
    }

    public event PropertyChangedEventHandler? PropertyChanged;
    protected void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
