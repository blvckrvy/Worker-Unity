namespace WorkerUnity.Models;

public class Chat : INotifyPropertyChanged
{
    public ObjectId ChatId { get; set; }

    public string? Name { get; set; }

    public ObservableCollection<Message> Messages { get; set; } = [];

    private int _unreadCount;
    public int UnreadCount
    {
        get => _unreadCount;
        set
        {
            _unreadCount = value;
            OnPropertyChanged(nameof(UnreadCount));
        }
    }

    public string? LastMessagePreviews { get; set; }

    public DateTimeOffset LastMessageTimestamp { get; set; }

    // INotifyPropertyChanged implementation
    public event PropertyChangedEventHandler? PropertyChanged;
    protected void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
