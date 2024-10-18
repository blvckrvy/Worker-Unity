namespace Worker_Unity
{
    public partial class MainPage : ContentPage
    {
        public MainPage(WorkersViewModel workersViewModel)
        {
            InitializeComponent();
            WorkersVM = workersViewModel;
        }

        public WorkersViewModel WorkersVM { get; }

        //handle login button click
        private async void login_btn_Clicked(object sender, EventArgs e)
        {
            string username = "worker";
            string password = "1234";
            //string username = usernameEntry.Text;
            //string password = passwordEntry.Text;

            // Simulate worker login
            if (username == "worker" && password == "1234") // Temporary check
            {
                //await DisplayAlert("Success", "Login successful!", "OK");
                WorkersVM.UserName = "Ryan";
                await Shell.Current.GoToAsync(nameof(WorkerPage),true); // Fetch the worker's first name from database and pass it here
            }
            else
            {
                await DisplayAlert("Error", "Invalid login credentials.", "OK");
            }
        }

        private async void OnAdminTapped(object sender, EventArgs e)
        {
            //redirect to admin login page
            await Navigation.PushAsync(new AdminLoginPage());
        }

        private async void signup_tapped(object sender, EventArgs e)
        {
            //redirect to sign up page
            await Navigation.PushAsync(new SignUpPage());
        }
    }

}
