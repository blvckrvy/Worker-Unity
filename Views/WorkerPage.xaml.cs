

using CommunityToolkit.Mvvm.Input;
using System.Diagnostics;

namespace Worker_Unity.Views;

public partial class WorkerPage : ContentPage
{
    private readonly WorkersViewModel viewModel;

    public WorkerPage(WorkersViewModel viewModel)
    {
        InitializeComponent();
        this.viewModel = viewModel;
        BindingContext = viewModel;
    }
    protected override void OnAppearing()
    {
        base.OnAppearing();
        viewModel.GetTasks();
    }
    private async void LogOut_btn_clicked(object sender, EventArgs e)
    {
        bool confirm = await Shell.Current.DisplayAlert("Log Out", "Are you sure you want to log out?", "Yes", "No");
        if (confirm)
        {
            await Shell.Current.GoToAsync("..");
        }
    }

    // Handle task selection (optional for details view)
    private void OnTaskSelected(object sender, SelectedItemChangedEventArgs e)
    {
        // Handle task details view if needed
    }

    private void TaskCompletedBtn_Clicked(object sender, EventArgs e)
    {
        var send = (Button)sender;
        var taskk = send.BindingContext;
        viewModel.ToggleTaskCompletionCommand.Execute(taskk);
    }

    private void DeleteTask_Clicked(object sender, EventArgs e)
    {

        var send = (Button)sender;
        var taskk = send.BindingContext;
        viewModel.DeleteTaskCommand.Execute(taskk);
    }

    private void AcceptBtn_Clicked(object sender, EventArgs e)
    {
        var send = (Button)sender;
        var taskk = send.BindingContext;
        //viewModel.
    }
} //TaskModel class for each task
public partial class TaskModel : ObservableObject
{
    [ObservableProperty]
    string? taskName;
    [ObservableProperty]
    string? taskDescription;
    [ObservableProperty]
    string? taskStatus;
    [ObservableProperty] 
    string? statusColor;

    [ObservableProperty]
    DateTime dueDate;
    [ObservableProperty]
    bool canAccept = true; // Initially true, changes when task is accepted
    [ObservableProperty]
    bool canComplete = false; // Changes when task is in progress
}

public partial class WorkersViewModel : ObservableObject
{
    [ObservableProperty]
    ObservableCollection<TaskModel> tasks = new();
    [ObservableProperty]
    bool hasTasks;
    [ObservableProperty]
    bool noTasks;

    public string? UserName;
    public WorkersViewModel()
    {
        GetTasks();
        //{
        //    new TaskModel {TaskName = "Task 1", TaskDescription = "Harvest Mushrooms", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(1)},
        //    new TaskModel {TaskName = "Task 2", TaskDescription = "Pack Mushrooms", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(2)},
        //    new TaskModel {TaskName = "Task 3", TaskDescription = "Plant Weed", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(3)},
        //    new TaskModel {TaskName = "Task 4", TaskDescription = "Harvest Weed", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(4)},
        //    new TaskModel {TaskName = "Task 5", TaskDescription = "Pack Weed", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(5)},
        //};
    }
    public void GetTasks()
    {
        Tasks =
        [
            new TaskModel {TaskName = "Task 1", TaskDescription = "Harvest Mushrooms", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(1)},
            new TaskModel {TaskName = "Task 2", TaskDescription = "Pack Mushrooms", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(2)},
            new TaskModel {TaskName = "Task 3", TaskDescription = "Plant Weed", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(3)},
            new TaskModel {TaskName = "Task 4", TaskDescription = "Harvest Weed", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(4)},
            new TaskModel {TaskName = "Task 5", TaskDescription = "Pack Weed", TaskStatus = "Not Started", StatusColor = "Black", DueDate = DateTime.Today.AddDays(5)},
        ];
        Debug.WriteLine("Tasks count is "+Tasks.Count);
    }
    [RelayCommand]
    async Task DeleteTask(TaskModel task)
    {
        
        if (task != null)
        {
            Tasks?.Remove(task);
            return;
            //what was the reasooooon ??!!! ~ ref to the meme lol
            string reason = await Shell.Current.DisplayPromptAsync("Decline Task", "Please provide a reason for declining this task:");

            if (!string.IsNullOrEmpty(reason))
            {
                await Shell.Current.DisplayAlert("Task Declined", $"Task declined with reason: {reason}", "OK");
                
            }
        }
    }

    private void CheckForOverdueTasks()
    {
        foreach (var task in Tasks)
        {
            if (task.DueDate < DateTime.Today && task.TaskStatus != "Completed")
            {
                task.TaskStatus = "Overdue";
                task.StatusColor = "Red";
            }
        }
    }
    [RelayCommand]
    void ToggleTaskCompletion(TaskModel task)
    {
        if (task != null)
        {
            task.TaskStatus = "Completed";
            task.StatusColor = "Green";
            task.CanComplete = false; //hide task completed button
        }
    }

    [RelayCommand]
    void SaveTaskAsCompleted(TaskModel task)
    {
        if (task != null)
        {
            task.TaskStatus = "In progress...";
            task.StatusColor = "Yellow";
            task.CanAccept = false; //disable accept/decline buttons
            task.CanComplete = true; //Show task completed button
        }
    }
}