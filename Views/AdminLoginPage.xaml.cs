namespace Worker_Unity.Views;

public partial class AdminLoginPage : ContentPage
{
	public AdminLoginPage()
	{
		InitializeComponent();
	}

	//handle admin login button
	private async void Adminlog_btn_clicked(object sender, EventArgs e)
	{
		string adminUsername = AdminUsernameEntry.Text;
		string adminPassword = AdminPasswordEntry.Text;

        // Check credentials (implement real authentication later)
        if (adminUsername == "unity" && adminPassword == "0052") // Temporary check
        {
            await DisplayAlert("Success", "Admin login successful!", "OK");
            // Navigate to AdminPage
            await Navigation.PushAsync(new AdminPage());
        }
        else
        {
            await DisplayAlert("Error", "Invalid admin credentials.", "OK");
        }
    }
}