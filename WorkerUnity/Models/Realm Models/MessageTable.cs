namespace WorkerUnity.Models.Realm_Models;

public class MessageTable : RealmObject
{
    [PrimaryKey]
    public ObjectId MessageID { get; set; } = ObjectId.GenerateNewId();

    public string? MessageSender { get; set; }
    public string? MessageText { get; set; }
    public DateTimeOffset Timestamp { get; set; }

    public bool IsUserMessage {  get; set; }

    public ChatTable? Chat { get; set; } // reference to chat table
}
