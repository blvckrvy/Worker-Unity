using static System.Net.Mime.MediaTypeNames;

namespace WorkerUnity.Views.Messages;

public partial class ChatMessages : ContentPage
{
    private readonly ChatService _chatService;
    private readonly string _currentUserId; // Store the current user's ID for comparison
    public ObservableCollection<Message> Messages { get; set; } = new();

    private readonly Chat _chat;
    private readonly string _senderName;

    public ChatMessages(ChatService chatService, Chat chat, string senderName)
    {
        InitializeComponent();
        _chatService = chatService;
        _chat = chat;
        _senderName = senderName;

        _currentUserId = Preferences.Get("CurrentUserId", string.Empty); // Retrieve current user's ID

        // Step 1: Retrieve all messages from Realm
        var allMessages = App.RealmInstance!.All<MessageTable>().ToList();

        // Step 2: Filter messages in memory based on the ChatID and set IsUserMessage correctly
        var messagesForChat = allMessages
            .Where(m => m.Chat != null && m.Chat.ChatID == _chat.ChatId)
            .Select(m => new Message
            {
                Sender = m.MessageSender,
                Text = m.MessageText,
                Timestamp = m.Timestamp.ToLocalTime(),
                IsRead = m.MessageSender != _senderName,
                IsUserMessage = m.MessageSender == _senderName // Set IsUserMessage based on whether the message is from the current user
            })
            .ToList();

        Messages = new ObservableCollection<Message>(messagesForChat);

        Title = chat.Name;
        BindingContext = this;
    }

    private async void OnSendClicked(object sender, EventArgs e)
    {
        var messageText = MessageEntry.Text?.Trim();
        if (!string.IsNullOrEmpty(messageText))
        {
            // Retrieve sender's ID from Preferences
            var currentUserId = Preferences.Get("CurrentUserId", string.Empty);

            // Parse the user ID as an ObjectId to match the type in Realm
            if (ObjectId.TryParse(currentUserId, out var currentUserObjectId))
            {
                // Fetch the current user directly by ObjectId without calling ToString()
                var currentUser = App.RealmInstance?.All<UserTable>()
                    .FirstOrDefault(u => u.UserID == currentUserObjectId);

                var senderName = currentUser?.Username ?? "Unknown User";

                // Send message via SignalR
                await _chatService.SendMessage(senderName, messageText);

                // Add message to Realm database and set IsUserMessage as true (current user is sending)
                App.RealmInstance?.Write(() =>
                {
                    var chatTable = App.RealmInstance.Find<ChatTable>(_chat.ChatId);
                    if (chatTable != null)
                    {
                        var messageToSave = new MessageTable
                        {
                            MessageSender = senderName,
                            MessageText = messageText,
                            Timestamp = DateTimeOffset.UtcNow.ToLocalTime(),
                            Chat = chatTable,
                            IsUserMessage = true // Mark this as a user message
                        };
                        App.RealmInstance.Add(messageToSave);

                        // Update last message and timestamp
                        chatTable.LastMessage = messageText;
                        chatTable.Timestamp = DateTimeOffset.UtcNow.ToLocalTime();
                    }
                });

                // Update UI to show the message with IsUserMessage = true
                Messages.Add(new Message
                {
                    Sender = senderName,
                    Text = messageText,
                    Timestamp = DateTimeOffset.UtcNow.ToLocalTime(),
                    IsRead = true,
                    IsUserMessage = true
                });

                // Clear the input field
                MessageEntry.Text = string.Empty;
            }
            else
            {
                await DisplayAlert("Error", "Invalid User ID", "OK");
            }
        }
    }

    public static string GetLocalTimeString(DateTimeOffset timestamp)
    {
        return timestamp.ToLocalTime().ToString("g");
    }
}