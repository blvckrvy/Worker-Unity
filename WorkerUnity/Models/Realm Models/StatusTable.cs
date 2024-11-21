namespace WorkerUnity.Models.Realm_Models;

public class StatusTable : RealmObject
{
    [PrimaryKey]
    public ObjectId StatusID { get; set; }
    public string? StatusName { get; set; }
    public string? StatusDescription { get; set; }
    public DateTimeOffset StatusDueDate { get; set; }
    public string? StatusProgress { get; set; }
    public string? StatusColor { get; set; }
    public string? TaskDeclineReason { get; set; }
    public bool showReason { get; set; }
    public IList<UserTable>? Workers { get; } = null;

    public string SharedTaskIdentifier { get; set; } = string.Empty;
}
