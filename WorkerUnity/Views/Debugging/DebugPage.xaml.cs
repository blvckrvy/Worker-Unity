namespace WorkerUnity.Views.Debugging;

public partial class DebugPage : ContentPage
{
	public DebugPage()
	{
		InitializeComponent();
	}

    private void OnViewAllDataClicked(object sender, EventArgs e)
    {
        ViewAllData();
        ViewOutput.Text = "Here is all the data found!";
    }
    
    private void OnDeleteAssignedTasksClicked(object sender, EventArgs e)
    {
        DeleteAssignedTasks();
        ViewOutput.Text = string.Empty;
        DebugOutput.Text = "Assigned tasks has been deleted!";
    }

    private void OnDeleteTasksClicked(object sender, EventArgs e)
    {
        DeleteTasksAndRefresh();
        ViewOutput.Text = string.Empty;
        DebugOutput.Text = "Task data has been deleted!";
    }

    private void OnDeleteArchivesClicked(object sender, EventArgs e)
    {
        DeleteArchivedTasks();
        ViewOutput.Text = string.Empty;
        DebugOutput.Text = "Archived data has been deleted!";
    }

    private void OnDeleteChatsClicked(object sender, EventArgs e)
    {
        DeleteChatTableAndRefresh();
        ViewOutput.Text = string.Empty;
        DebugOutput.Text = "Chat data has been deleted!";
    }

    private void OnDeleteMessagesClicked(object sender, EventArgs e)
    {
        DeleteMessageTableAndRefresh();
        ViewOutput.Text = string.Empty;
        DebugOutput.Text = "Message data has been deleted!";
    }

    private void OnDeleteAllDataClicked(object sender, EventArgs e)
    {
        DeleteAllDataAndRefresh();
        ViewOutput.Text = string.Empty;
        DebugOutput.Text = "All data has been deleted!";
    }

    // View all entries
    private void ViewAllData()
    {
        var users = App.RealmInstance?.All<UserTable>().ToList();
        var taskAssignments = App.RealmInstance?.All<TaskAssignmentTable>().ToList();
        var taskAssigned = App.RealmInstance?.All<StatusTable>().ToList();
        var archivedTasks = App.RealmInstance?.All<ArchiveTable>().ToList();
        var messages = App.RealmInstance?.All<MessageTable>().ToList();
        var chats = App.RealmInstance?.All<ChatTable>().ToList();

        var output = "Users:\n\n";
        foreach (var user in users!)
            output +=
                $"UserID: {user.UserID}\n" +
                $"First Name: {user.FirstName}\n" +
                $"Last Name: {user.LastName}\n" +
                $"Username: {user.Username}\n" +
                $"PasswordHash: {user.PasswordHash}\n" +
                $"Role: {user.Role}\n" +
                $"\n-----------------------------------------\n\n";

        output += "\nTasks:\n\n";
        foreach (var taskAssignment in taskAssignments!)
            output +=
                $"TaskID: {taskAssignment.TaskAssignmentID}\n" +
                $"Task Name: {taskAssignment.TaskAssignmentName}\n" +
                $"Task Description: {taskAssignment.TaskAssignmentDescription}\n" +
                $"Task Progress: {taskAssignment.TaskAssignmentProgress}\n" +
                $"Accept Button: {taskAssignment.TaskAcceptButton}\n" +
                $"Decline Button: {taskAssignment.TaskDeclineButton}\n" +
                $"Start Button: {taskAssignment.TaskStartButton}\n" +
                $"Completed Button: {taskAssignment.TaskCompletedButton}\n" +
                $"Archive Button: {taskAssignment.TaskArchiveButton}\n" +
                $"Workers: {taskAssignment.Workers}\n" +
                $"Uploaded File: {taskAssignment.UploadedFile}\n" +
                $"Due Date: {taskAssignment.DueDate}\n" +
                $"\n-----------------------------------------\n\n";

        output += "\nAssigned Tasks:\n\n";
        foreach (var assignedTask in taskAssigned!)
            output +=
                $"StatusID: {assignedTask.StatusID}\n" +
                $"Task Name: {assignedTask.StatusName}\n" +
                $"Task Description: {assignedTask.StatusDescription}\n" +
                $"Task Progress: {assignedTask.StatusProgress}\n" +
                $"Progress Color: {assignedTask.StatusColor}\n" +
                $"Decline Reason: {assignedTask.TaskDeclineReason}\n" +
                $"show Reason: {assignedTask.showReason}\n" +
                $"\n-----------------------------------------\n\n";

        output += "\nArchived Tasks:\n\n";
        foreach (var archivedTask in archivedTasks!)
            output +=
                $"ArchiveID: {archivedTask.ArchiveID}\n" +
                $"Archive Name: {archivedTask.ArchiveName}\n" +
                $"Archive Description: {archivedTask.ArchiveDescription}\n" +
                $"Archive Condition: {archivedTask.ArchiveCondition}\n" +
                $"Archive Due Date: {archivedTask.ArchiveDueDate}\n" +
                $"Worker: {archivedTask.Workers}\n" +
                $"\n-----------------------------------------\n\n";

        output += "\nChats:\n\n";
        foreach (var chat in  chats!)
            output +=
                $"ChatID: {chat.ChatID}\n" +
                $"Chat Name: {chat.ChatName}\n" +
                $"Last Message: {chat.LastMessage}\n" +
                $"Timestamp: {chat.Timestamp}\n" +
                $"Unread count: {chat.UnreadCount}\n\n" +
                $"\n-----------------------------------------\n\n";

        output += "\nMessages:\n\n";
        foreach ( var message in messages!)
            output +=
                $"MessageID: {message.MessageID}\n" +
                $"Message Sender: {message.MessageSender}\n" +
                $"Message Text: {message.MessageText}\n" +
                $"Timestamp: {message.Timestamp}\n" +
                $"Chat: {message.Chat}\n\n" +
                $"\n-----------------------------------------\n\n";

        DebugOutput.Text = output; // Display data in the Label
    }

    // Delete all entries and refresh UI-bound data
    private void DeleteAllDataAndRefresh()
    {
        App.RealmInstance?.Write(() =>
        {
            App.RealmInstance.RemoveAll<UserTable>();
            App.RealmInstance.RemoveAll<TaskAssignmentTable>();
            App.RealmInstance.RemoveAll<MessageTable>();
            App.RealmInstance.RemoveAll<ChatTable>();
            App.RealmInstance.RemoveAll<StatusTable>();
            App.RealmInstance.RemoveAll<ArchiveTable>();
        });

        // Clear UI-bound ObservableCollections if needed
        if (BindingContext is ChatList chatListPage)
        {
            chatListPage.Chats.Clear(); // Adjust based on your actual binding context
        }
    }

    private void DeleteMessageTableAndRefresh()
    {
        App.RealmInstance?.Write(() =>
        {
            App.RealmInstance.RemoveAll<MessageTable>();
        });

        if (BindingContext is ChatList chatListPage)
        {
            chatListPage.Chats.Clear(); // Adjust based on your actual binding context
        }
    }
    
    private void DeleteChatTableAndRefresh()
    {
        App.RealmInstance?.Write(() =>
        {
            App.RealmInstance.RemoveAll<ChatTable>();
        });

        if (BindingContext is ChatList chatListPage)
        {
            chatListPage.Chats.Clear(); // Adjust based on your actual binding context
        }
    }

    private void DeleteTasksAndRefresh()
    {
        App.RealmInstance?.Write(() =>
        {
            App.RealmInstance.RemoveAll<TaskAssignmentTable>();
        });
    }

    private void DeleteArchivedTasks()
    {
        App.RealmInstance?.Write(() =>
        {
            App.RealmInstance.RemoveAll<ArchiveTable>();
        });
    }
    
    private void DeleteAssignedTasks()
    {
        App.RealmInstance?.Write(() =>
        {
            App.RealmInstance.RemoveAll<StatusTable>();
        });
    }
}