namespace WorkerUnity.Models.Realm_Models;

public class ChatTable : RealmObject
{
    [PrimaryKey]
    public ObjectId ChatID { get; set; } = ObjectId.GenerateNewId();

    public string? ChatName { get; set; }
    public string? LastMessage { get; set; }
    public DateTimeOffset Timestamp { get; set; }

    public IList<UserTable>? Users { get; }

    // New property to track if the current user is in this chat
    public bool IsCurrentUserInChat { get; set; }

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
}
