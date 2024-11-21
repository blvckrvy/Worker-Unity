namespace WorkerUnity.Models.Realm_Models;

public class ArchiveTable : RealmObject
{
    [PrimaryKey]
    public ObjectId ArchiveID { get; set; }
    public string? ArchiveName { get; set; }
    public string? ArchiveDescription { get; set; }
    public DateTimeOffset ArchiveDueDate { get; set; }
    public string? ArchiveCondition { get; set; }
    public IList<UserTable>? Workers { get; } = null;
}
