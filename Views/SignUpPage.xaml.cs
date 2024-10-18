using Worker_Unity.Services;

namespace Worker_Unity.Views;

public partial class SignUpPage : ContentPage
{
	private AuthService _authService;
	private FirestoreService _firestoreService;

	public SignUpPage()
	{
		InitializeComponent();
		_authService = new AuthService();
		_firestoreService = new FirestoreService();
	}

	//handle signup button
	private async void Signup_btn_clicked(object sender, EventArgs e)
	{
		string firstName = firstNameEntry.Text;
		string lastName = lastNameEntry.Text;
		
		string username = usernameEntry.Text;
		string password = passwordEntry.Text;
		
		string confirmPassword = confirmpasswordEntry.Text;
		string selectedRole = rolePicker.SelectedItem?.ToString()!;

		bool error = false;

		if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) ||
			string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) ||
			string.IsNullOrEmpty(confirmPassword) || string.IsNullOrEmpty(selectedRole))
		{
			await DisplayAlert("Error Missing", "All fields are required.", "OK");
			error = true;
		}

		if (password != confirmPassword)
		{
			await DisplayAlert("Error PW", "Password do not match.", "OK");
			error = true;
			return;
		}

		if (!error)
		{
            // Register the user using Firebase Authentication
            var registerResult = await _authService.RegisterUser(username, password);
            if (registerResult.StartsWith("Error"))
            {
                await DisplayAlert("Error When Register", registerResult, "OK");
                return;
            }

            // Get the currently registered user's ID from Firebase
            var userId = _authService.UserUid;

            // Save additional user data (firstName, lastName, role) in Firestore
            var firestoreResult = await _firestoreService.AddUserData(userId, firstName, lastName, selectedRole);

            if (firestoreResult.StartsWith("Error"))
            {
                await DisplayAlert("Error When Adding", firestoreResult, "OK");
                return;
            }

            //save these values to the database
            await DisplayAlert("Success", $"Welcome, {firstName}! You have signed up as a {selectedRole}", "Thank you!");

            //redirect back to login page
            await Navigation.PopAsync();
        }
    }
}