namespace WorkerUnity
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private async void Login_btn_Clicked(object sender, EventArgs e)
        {
            //redirect to worker login page
            await Navigation.PushAsync(new WorkerLogin());
        }

        private async void Admin_btn_Clicked(object sender, EventArgs e)
        {
            //redirect to admin login page
            await Navigation.PushAsync(new AdminLogin());
        }

        private async void SignUp_btn_Clicked(object sender, EventArgs e)
        {
            //redirect to signup page
            await Navigation.PushAsync(new SignUpPage());
        }

        private async void Database_Clicked(object sender, EventArgs e)
        {
            //redirect to database page
            await Navigation.PushAsync(new DebugPage());
        }
    }
}
