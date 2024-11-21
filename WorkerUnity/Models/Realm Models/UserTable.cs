namespace WorkerUnity.Models.Realm_Models;

public class UserTable : RealmObject
{
    [PrimaryKey]
    public ObjectId UserID { get; set; } =  ObjectId.GenerateNewId();

    public string? UserId { get; set; }

    public string? FirstName { get; set; }
    public string? LastName { get; set; }
    public string? Username { get; set; }
    public string? PasswordHash { get; set; }
    public string? Role { get; set; }
}