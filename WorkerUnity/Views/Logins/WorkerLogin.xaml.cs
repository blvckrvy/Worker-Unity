namespace WorkerUnity.Views;

public partial class WorkerLogin : ContentPage
{
    public WorkerLogin()
	{
		InitializeComponent();
	}

    private async void OnLoginClicked(object sender, EventArgs e)
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
                                              && u.Role == "Worker");

        if (user != null)
        {
            Preferences.Set("CurrentUserId", user.UserID.ToString());
            Preferences.Set("CurrentUserName", user.Username?.ToString());

            await Navigation.PushAsync(new WorkerPage());
        }
        else
        {
            await DisplayAlert("Login Error", "Incorrect username or password", "Try again...");
        }
    }
}