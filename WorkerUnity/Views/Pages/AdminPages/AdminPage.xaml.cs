namespace WorkerUnity.Views.Pages;

public partial class AdminPage : ContentPage
{
    public AdminPage()
    {
        InitializeComponent();
    }

    protected override bool OnBackButtonPressed() { return true; }

    private async void OnChatClicked(Object sender, EventArgs e)
    {
        var chatService = new ChatService(); // Create or retrieve an instance of ChatService
        await Navigation.PushAsync(new ChatList(chatService));
    }

    private async void OnLogoutClicked(Object sender, EventArgs e)
    {
        bool confirm = await DisplayAlert("Log Out", "Are you sure you want to log out?", "Yes", "No");
        if (confirm)
        {
            await Navigation.PopToRootAsync();
        }
    }

    private async void TrackTaskClicked(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new TaskStatusTracker());
    }

    private async void TaskAssignClicked(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new TaskAssignment());
    }
}
