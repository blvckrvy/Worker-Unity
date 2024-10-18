using FirebaseAdmin.Auth;

namespace Worker_Unity.Services;

public class AuthService
{

    private FirebaseAuth _auth;
    public string UserUid = string.Empty;
    public AuthService()
    {
        
    }
    public async Task<string> RegisterUser(string email, string password)
    {
        try
        {
            UserRecordArgs userArgs = new UserRecordArgs();
            userArgs.Email = email;
            userArgs.Password = password;
            var user = await _auth.CreateUserAsync(userArgs);
            return $"User {user.Email} registered successfully!";
        }
        catch (FirebaseAuthException ex)
        {
            return $"Error: {ex.Message}";
        }
    }

    public async Task<string> LoginUser(string email, string password)
    {
        try
        {
            UserRecord? user = await _auth.GetUserByEmailAsync(email);
            UserUid = user.Uid;
            return $"User {user.Email} logged in successfully!";
        }
        catch (FirebaseAuthException ex)
        {
            return $"Error: {ex.Message}";
        }
    }

}