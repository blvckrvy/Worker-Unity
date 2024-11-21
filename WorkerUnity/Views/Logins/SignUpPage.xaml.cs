
using System.Data;

namespace WorkerUnity.Views;

public partial class SignUpPage : ContentPage
{
	public SignUpPage()
	{
		InitializeComponent();
	}

	private async void OnSignUpClicked(object sender, EventArgs e)
	{
		var firstName = firstNameEntry.Text;
        var lastName = lastNameEntry.Text;
        var username = usernameEntry.Text;
        var password = passwordEntry.Text;
        var confirmPassword = confirmpasswordEntry.Text;
        var selectedRole = rolePicker.SelectedItem?.ToString()!;

        bool error = false;

		if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) ||
			string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) ||
			string.IsNullOrEmpty(confirmPassword) || string.IsNullOrEmpty(selectedRole))
		{
			await DisplayAlert("Error!", "All fields are required.", "OK");
			error = true;
		}

		if (password != confirmPassword)
		{
			await DisplayAlert("Error!", "Passwords do not match.", "OK");
			error = true;
			return;
		}

		if (!error)
		{
            var hashedPassword = SecurityHelper.HashPassword(password);

            App.RealmInstance?.Write(() =>
            {
                var user = new UserTable
                {
                    FirstName = firstName,
                    LastName = lastName,
                    Username = username,
                    PasswordHash = hashedPassword,
                    Role = selectedRole
                };
                App.RealmInstance.Add(user);
            });

            await DisplayAlert("Success", $"Welcome, {username}!\nYou have signed up as {selectedRole}", "Thank you!");

			if (selectedRole == "Worker")
			{
				await Navigation.PushAsync(new WorkerLogin());
            }
            else if (selectedRole == "Admin")
            {
                await Navigation.PushAsync(new AdminLogin());
            }

            firstNameEntry.Text = string.Empty;
            lastNameEntry.Text = string.Empty;
            usernameEntry.Text = string.Empty;
            passwordEntry.Text = string.Empty;
            confirmpasswordEntry.Text = string.Empty;
            rolePicker.SelectedItem = null;
        }
	}
}