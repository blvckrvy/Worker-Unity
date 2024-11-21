using static Android.App.ActivityManager;
using System.ComponentModel;
using System.Threading.Tasks;
using WorkerUnity.Models.Realm_Models;
using WorkerUnity.Views.Pages.AdminPages;

namespace WorkerUnity.Views.Pages;

public partial class WorkerPage : ContentPage
{
    public ObservableCollection<TaskItem> Tasks { get; set; }

    public WorkerPage()
    {
        InitializeComponent();
        BindingContext = this;
        LoadUserData();
        Tasks = LoadWorkerTasks(); // retrieve from database
        OverdueTasks();
        LoadTasks();
    }

    protected override bool OnBackButtonPressed() { return true; }

    public ObservableCollection<TaskItem> LoadWorkerTasks()
    {
        var currentWorkerId = Preferences.Get("CurrentUserId", string.Empty);
        if (string.IsNullOrEmpty(currentWorkerId))
        {
            return [];
        }

        var allTasks = App.RealmInstance?.All<TaskAssignmentTable>()
            .ToList();

        var workerTasks = allTasks?
            .Where(t => t.Workers != null
                                && t.Workers.Any(w => w.UserID.ToString() == currentWorkerId))
            .ToList();

        var taskItems = workerTasks?
            .Select(MapToTaskItem)
            .ToList() ?? [];

        return new ObservableCollection<TaskItem>(taskItems);
    }

    private TaskItem MapToTaskItem(TaskAssignmentTable taskAssignment)
    {
        return new TaskItem
        {
            TaskId = taskAssignment.TaskAssignmentID,
            TaskName = taskAssignment.TaskAssignmentName,
            TaskDescription = taskAssignment.TaskAssignmentDescription,
            TaskProgress = taskAssignment.TaskAssignmentProgress,
            CanAccept = taskAssignment.TaskAcceptButton,
            CanDecline = taskAssignment.TaskDeclineButton,
            CanStart = taskAssignment.TaskStartButton,
            CanComplete = taskAssignment.TaskCompletedButton,
            CanArchive = taskAssignment.TaskArchiveButton,
            StatusColor = taskAssignment.TaskStatusColor,
            TaskDueDate = taskAssignment.DueDate
        };
    }

    private void LoadUserData()
    {
        string username = Preferences.Get("CurrentUserName", "User");
        WelcomeLabel.Text = $"Welcome, {username} ;)";
    }

    private void LoadTasks()
    {
        if (Tasks != null && Tasks.Count > 0)
        {
            NoTasksLayout.IsVisible = false;
            TaskHeaderLabel.IsVisible = true;
            TaskListView.IsVisible = true;
            TaskListView.ItemsSource = Tasks;
        }
        else
        {
            NoTasksLayout.IsVisible = true;
            TaskHeaderLabel.IsVisible = false;
            TaskListView.IsVisible = false;
        }
    }

    private void OverdueTasks()
    {
        if (Tasks == null) { return; }

        foreach (var task in Tasks)
        {
            if (task.TaskDueDate < DateTime.Today.AddDays(1) && task.TaskProgress != "Completed ^_^")
            {
                //update the ui
                task.TaskProgress = "Overdue ￣へ￣";
                task.StatusColor = "DarkRed";
                task.CanAccept = false;
                task.CanDecline = false;
                task.CanArchive = true;

                //update the database
                var tasktable = App.RealmInstance?.Find<TaskAssignmentTable>(task.TaskId);
                if (tasktable != null)
                {
                    //update the task table
                    App.RealmInstance?.Write(() =>
                    {
                        tasktable.TaskAssignmentProgress = task.TaskProgress;
                        tasktable.TaskAcceptButton = task.CanAccept;
                        tasktable.TaskDeclineButton = task.CanDecline;
                        tasktable.TaskArchiveButton = task.CanArchive;
                        tasktable.TaskStatusColor = task.StatusColor;
                    });

                    //add to the archive table
                    App.RealmInstance?.Write(() =>
                    {
                        var currentWorkerId = Preferences.Get("CurrentUserId", string.Empty);
                        if (string.IsNullOrEmpty(currentWorkerId))
                            return;

                        var currentWorker = App.RealmInstance?.Find<UserTable>(ObjectId.Parse(currentWorkerId));
                        if (currentWorker == null)
                            return;

                        var archives = new ArchiveTable
                        {
                            ArchiveID = ObjectId.GenerateNewId(),
                            ArchiveName = task.TaskName,
                            ArchiveDescription = task.TaskDescription,
                            ArchiveDueDate = task.TaskDueDate,
                            ArchiveCondition = "Task Overdue",
                        };
                        archives.Workers?.Add(currentWorker);
                        App.RealmInstance?.Add(archives);
                    });
                }

                var statusTable = App.RealmInstance?.All<StatusTable>()
                    .FirstOrDefault(s => s.SharedTaskIdentifier == tasktable!.SharedTaskIdentifier);
                if (statusTable != null)
                {
                    App.RealmInstance?.Write(() =>
                    {
                        statusTable.StatusProgress = "Task Overdue";
                        statusTable.StatusColor = "DarkRed";
                    });
                }
            }
        }
    }

    private async void OnArchivesClicked(Object sender, EventArgs e)
    {
        await Navigation.PushAsync(new ArchivesPage());
    }

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

    //accept button action
    private void OnAcceptClicked(object sender, EventArgs e)
    {
        //update the ui
        var task = (TaskItem)((Button)sender).CommandParameter;
        task.CanAccept = false;
        task.CanDecline = false;
        task.CanStart = true;
        LoadTasks();

        //update the database
        var tasktable = App.RealmInstance?.Find<TaskAssignmentTable>(task.TaskId);
        if (tasktable != null)
        {
            App.RealmInstance?.Write(() =>
            {
                tasktable.TaskAcceptButton = task.CanAccept;
                tasktable.TaskDeclineButton = task.CanDecline;
                tasktable.TaskStartButton = task.CanStart;
            });
        }
    }

    //decline button action
    private async void OnDeclineClicked(object sender, EventArgs e)
    {
        //update the ui
        var task = (TaskItem)((Button)sender).CommandParameter;
        string reason = await DisplayPromptAsync("Decline Task?", "Please provide a reason for declining your task. (._. )");
        if (!string.IsNullOrEmpty(reason))
        {
            task.TaskReason = reason;
            if (await Shell.Current.DisplayAlert("Are you sure you want to decline this task ?", $"Reason: {reason}", "Yes", "Cancel"))
            {
                task.TaskProgress = "Declined :(";
                task.StatusColor = "Red";
                task.CanAccept = false;
                task.CanDecline = false;
                task.CanArchive = true;

                var tasktable = App.RealmInstance?.Find<TaskAssignmentTable>(task.TaskId);
                if (tasktable != null)
                {
                    //update the task table
                    App.RealmInstance?.Write(() =>
                    {
                        tasktable.TaskAssignmentProgress = task.TaskProgress;
                        tasktable.TaskAcceptButton = task.CanAccept;
                        tasktable.TaskDeclineButton = task.CanDecline;
                        tasktable.TaskArchiveButton = task.CanArchive;
                        tasktable.TaskStatusColor = task.StatusColor;
                    });

                    //add to the archive table
                    App.RealmInstance?.Write(() =>
                    {
                        var currentWorkerId = Preferences.Get("CurrentUserId", string.Empty);
                        if (string.IsNullOrEmpty(currentWorkerId))
                            return;

                        var currentWorker = App.RealmInstance?.Find<UserTable>(ObjectId.Parse(currentWorkerId));
                        if (currentWorker == null)
                            return;

                        var archives = new ArchiveTable
                        {
                            ArchiveID = ObjectId.GenerateNewId(),
                            ArchiveName = task.TaskName,
                            ArchiveDescription = task.TaskDescription,
                            ArchiveDueDate = task.TaskDueDate,
                            ArchiveCondition = "Task Declined",
                        };
                        archives.Workers?.Add(currentWorker);
                        App.RealmInstance?.Add(archives);
                    });
                }

                var statusTable = App.RealmInstance?.All<StatusTable>()
                    .FirstOrDefault(s => s.SharedTaskIdentifier == tasktable!.SharedTaskIdentifier);
                if (statusTable != null)
                {
                    App.RealmInstance?.Write(() =>
                    {
                        statusTable.StatusProgress = "Task Declined";
                        statusTable.StatusColor = "Red";
                        statusTable.TaskDeclineReason = reason;
                        statusTable.showReason = true;
                    });
                }
            }
        }
    }

    //start button action
    private void OnStartClicked(object sender, EventArgs e)
    {
        if (sender is Button button && button.CommandParameter is TaskItem task)
        {
            //update the ui
            task.TaskProgress = "In progress...";
            task.StatusColor = "YellowGreen";
            task.CanStart = false;
            task.CanComplete = true;

            //update the database
            var tasktable = App.RealmInstance?.Find<TaskAssignmentTable>(task.TaskId);
            if (tasktable != null)
            {
                App.RealmInstance?.Write(() =>
                {
                    tasktable.TaskAssignmentProgress = task.TaskProgress;
                    tasktable.TaskStartButton = task.CanStart;
                    tasktable.TaskCompletedButton = task.CanComplete;
                    tasktable.TaskStatusColor = task.StatusColor;
                });
            }

            var statusTable = App.RealmInstance?.All<StatusTable>()
            .FirstOrDefault(s => s.SharedTaskIdentifier == tasktable!.SharedTaskIdentifier);
            if (statusTable != null)
            {
                App.RealmInstance?.Write(() =>
                {
                    statusTable.StatusProgress = "In progress...";
                    statusTable.StatusColor = "YellowGreen";
                });
            }
        }
    }

    //task completed action
    private void OnCompletedClicked(Object sender, EventArgs e)
    {
        //update the ui
        var task = (TaskItem)((Button)sender).CommandParameter;
        task.TaskProgress = "Completed ^_^";
        task.StatusColor = "Green";
        task.CanComplete = false;
        task.CanArchive = true;

        var tasktable = App.RealmInstance?.Find<TaskAssignmentTable>(task.TaskId);
        if (tasktable != null)
        {
            //update the task table
            App.RealmInstance?.Write(() =>
            {
                tasktable.TaskAssignmentProgress = task.TaskProgress;
                tasktable.TaskArchiveButton = task.CanArchive;
                tasktable.TaskCompletedButton = task.CanComplete;
                tasktable.TaskStatusColor = task.StatusColor;
            });

            //add to the archive table
            App.RealmInstance?.Write(() =>
            {
                var currentWorkerId = Preferences.Get("CurrentUserId", string.Empty);
                if (string.IsNullOrEmpty(currentWorkerId))
                    return;

                var currentWorker = App.RealmInstance?.Find<UserTable>(ObjectId.Parse(currentWorkerId));
                if (currentWorker == null)
                    return;

                var archives = new ArchiveTable
                {
                    ArchiveID = ObjectId.GenerateNewId(),
                    ArchiveName = task.TaskName,
                    ArchiveDescription = task.TaskDescription,
                    ArchiveDueDate = task.TaskDueDate,
                    ArchiveCondition = "Task Completed",
                };
                archives.Workers?.Add(currentWorker);
                App.RealmInstance?.Add(archives);
            });
        }

        var statusTable = App.RealmInstance?.All<StatusTable>()
            .FirstOrDefault(s => s.SharedTaskIdentifier == tasktable!.SharedTaskIdentifier);
        if (statusTable != null)
        {
            App.RealmInstance?.Write(() =>
            {
                statusTable.StatusProgress = "Task Completed";
                statusTable.StatusColor = "Green";
            });
        }
    }

    //archive button action
    private void OnArchiveClicked(Object sender, EventArgs e)
    {
        //update the ui
        var task = (TaskItem)((Button)sender).CommandParameter;
        Tasks.Remove(task);
        LoadTasks();

        //update the task table
        var tasktable = App.RealmInstance?.Find<TaskAssignmentTable>(task.TaskId);
        if (tasktable != null)
        {
            App.RealmInstance?.Write(() =>
            {
                App.RealmInstance.Remove(tasktable);
            });
        }
    }
}
