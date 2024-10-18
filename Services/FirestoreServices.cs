using Google.Cloud.Firestore;

namespace Worker_Unity.Services
{
    public class FirestoreService
    {
        private readonly FirestoreDb _firestoreDb;
        CollectionReference fsCollection;
        public FirestoreService()
        {
            _firestoreDb = FirestoreDb.Create("workerunity-a6111");
        }

        // Method to add user data using native .NET types (no Java interop)
        public async Task<string> AddUserData(string UserId, string firstName, string lastName, string role)
        {
            try
            {
                // Get reference to 'users' collection
                fsCollection = _firestoreDb.Collection("Users");
                //.Document(UserId);
                var doccRef = fsCollection.Document(UserId);
                // Define the user data as a .NET Dictionary
                var user = new Dictionary<string, object>
                {
                    { "FirstName", firstName },
                    { "LastName", lastName },
                    { "Role", role }
                };
                
                // Set the document in Firestore
                await doccRef.SetAsync(user);

                return "User data added successfully!";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }

        // Method to retrieve user data
        public async Task<Dictionary<string, object>> GetUserData(string userId)
        {
            try
            {
                // Reference to the document
                var docRef = _firestoreDb.Collection("users").Document(userId);
                var snapshot = await docRef.GetSnapshotAsync();
                

                if (snapshot.Exists)
                {
                    // Return the document data as a Dictionary
                    return snapshot.ToDictionary();
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"Error retrieving user data: {ex.Message}");
            }
        }
    }
}