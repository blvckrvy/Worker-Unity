namespace WorkerUnity.Models;

public class ArchivedItems : INotifyPropertyChanged
{
    public ObjectId ArchivedId { get; set; }
    public string? _name {  get; set; }
    public string? _description { get; set; }
    public DateTimeOffset _dueDate { get; set; }
    public string? _condition { get; set; }
    public IList<UserTable>? _workerName { get; set; }
    public string? _taskReason { get; set; }
    public string? _statusColor { get; set; }
    public string? _taskProgress { get; set; }


    public string? ArchivedTaskName
    {
        get => _name;
        set { _name = value; OnPropertyChanged(nameof(ArchivedTaskName)); }
    }

    public string? ArchivedTaskDescription
    {
        get => _description;
        set { _description = value; OnPropertyChanged(nameof(ArchivedTaskDescription)); }
    }

    public DateTimeOffset ArchivedTaskDueDate
    {
        get => _dueDate;
        set { _dueDate = value; OnPropertyChanged(nameof(ArchivedTaskDueDate)); }
    }

    public string? ArchivedTaskCondition
    {
        get => _condition;
        set { _condition = value; OnPropertyChanged(nameof(ArchivedTaskCondition)); }
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

    public string? TaskReason
    {
        get => _taskReason;
        set { _taskReason = value; OnPropertyChanged(nameof(TaskReason)); }
    }
    
    public string? TaskProgressColor
    {
        get => _statusColor;
        set { _statusColor = value; OnPropertyChanged(nameof(TaskProgressColor)); }
    }

    public string? TaskProgress
    {
        get => _taskProgress;
        set { _taskProgress = value; OnPropertyChanged(nameof(TaskProgress)); }
    }

    public event PropertyChangedEventHandler? PropertyChanged;
    protected void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
