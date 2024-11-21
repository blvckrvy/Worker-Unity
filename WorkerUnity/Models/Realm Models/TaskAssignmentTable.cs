namespace WorkerUnity.Models.Realm_Models;

public class TaskAssignmentTable : RealmObject
{
    [PrimaryKey]
    public ObjectId TaskAssignmentID { get; set; } = ObjectId.GenerateNewId();

    public string? TaskAssignmentName { get; set; }
    public string? TaskAssignmentDescription { get; set; }
    public string? TaskAssignmentProgress { get; set; }
    public bool TaskAcceptButton { get; set; }
    public bool TaskDeclineButton { get; set; }
    public bool TaskStartButton { get; set; }
    public bool TaskCompletedButton { get; set; }
    public bool TaskArchiveButton { get; set; }
    public string? TaskStatusColor { get; set; }
    public IList<UserTable>? Workers { get; } //collection of assigned workers
    public byte[]? UploadedFile { get; set; } //file in byte array
    public DateTimeOffset DueDate { get; set; }

    public string SharedTaskIdentifier { get; set; } = Guid.NewGuid().ToString();
}
