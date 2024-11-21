
namespace WorkerUnity.Views;

public partial class AdminLogin : ContentPage
{
	public AdminLogin()
	{
		InitializeComponent();
	}

    private async void OnAdminClicked(object sender, EventArgs e)
    {
        var username = usernameEntry.Text?.Trim();
        var password = passwordEntry.Text?.Trim();

        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
        {
            await DisplayAlert("Error", "All fields are required.", "OK");
            return;
        }

        var hashedPassword = SecurityHelper.HashPassword(password);
        var user = App.RealmInstance?.All<UserTable>()
                    .FirstOrDefault(u => u.Username == username 
                                              && u.PasswordHash == hashedPassword
                                              && u.Role == "Admin");

        if (user != null)
        {
            Preferences.Set("CurrentUserId", user.UserID.ToString());
            Preferences.Set("CurrentUserName", user.Username?.ToString());
            await Navigation.PushAsync(new AdminPage());
        }
        else
        {
            await DisplayAlert("Login Error", "Incorrect username or password", "Try again...");
        }
    }
}