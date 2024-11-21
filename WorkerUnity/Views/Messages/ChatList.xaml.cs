namespace WorkerUnity.Views.Messages
{
    public partial class ChatList : ContentPage, INotifyPropertyChanged
    {
        private readonly ChatService _chatService;

        public ObservableCollection<Chat> Chats { get; set; } = new ObservableCollection<Chat>();

        public ChatList(ChatService chatService)
        {
            InitializeComponent();
            _chatService = chatService;
            BindingContext = this;
            _chatService.MessageReceived += OnMessageReceived;
            LoadChatsForUser(); // Load chats on initialization
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            LoadChatsForUser();
        }

        private void LoadChatsForUser()
        {
            var currentUserIdString = Preferences.Get("CurrentUserId", string.Empty);
            if (string.IsNullOrEmpty(currentUserIdString))
                return;

            var currentUserId = ObjectId.Parse(currentUserIdString);

            // Step 1: Fetch all ChatTable entries without filtering in Realm
            var allChats = App.RealmInstance?.All<ChatTable>().ToList() ?? new List<ChatTable>();

            // Step 2: Perform in-memory filtering and mapping
            var userChats = new List<Chat>();
            foreach (var chatTable in allChats)
            {
                if (chatTable.Users != null && chatTable.Users.Any(u => u.UserID == currentUserId))
                {
                    userChats.Add(MapToChat(chatTable, currentUserId));
                }
            }

            // Step 3: Update the ObservableCollection to refresh the UI
            Chats.Clear();
            foreach (var chat in userChats)
            {
                Chats.Add(chat);
            }
        }

        private Chat MapToChat(ChatTable chatTable, ObjectId currentUserId)
        {
            // Get the other user's information for display
            var otherUser = chatTable.Users?.FirstOrDefault(u => u.UserID != currentUserId);
            var chatName = otherUser != null ? $"{otherUser.FirstName} {otherUser.LastName}" : chatTable.ChatName;

            return new Chat
            {
                ChatId = chatTable.ChatID,
                Name = chatName,
                LastMessagePreviews = chatTable.LastMessage,
                LastMessageTimestamp = chatTable.Timestamp.ToLocalTime(),
                UnreadCount = chatTable.UnreadCount,
                Messages = new ObservableCollection<Message>() // Placeholder for actual messages
            };
        }

        private async void OnNewChatClicked(object sender, EventArgs e)
        {
            var currentUserObjectIdString = Preferences.Get("CurrentUserId", string.Empty);
            if (string.IsNullOrEmpty(currentUserObjectIdString))
            {
                await DisplayAlert("Error", "Unable to retrieve the current user", "OK");
                return;
            }

            var currentUserObjectId = ObjectId.Parse(currentUserObjectIdString);

            // Fetch all users and filter manually for users not matching current user
            var allUsers = App.RealmInstance?.All<UserTable>().ToList() ?? new List<UserTable>();
            var availableUsers = allUsers.Where(u => u.UserID != currentUserObjectId).ToList();

            if (availableUsers.Count == 0)
            {
                await DisplayAlert("No Users Available", "No other users found to start a chat with.", "OK");
                return;
            }

            var userNames = availableUsers.Select(user => $"{user.FirstName} {user.LastName} - {user.Role}").ToArray();
            var selectedUserName = await DisplayActionSheet("Select a user", "Cancel", null, userNames);

            if (string.IsNullOrEmpty(selectedUserName) || selectedUserName == "Cancel")
            {
                return;
            }

            var selectedUser = availableUsers.FirstOrDefault(u => $"{u.FirstName} {u.LastName} - {u.Role}" == selectedUserName);

            if (selectedUser == null)
            {
                await DisplayAlert("Error", "Unable to find selected user", "OK");
                return;
            }

            // Add the new chat to Realm
            ChatTable? newChat = null;
            App.RealmInstance?.Write(() =>
            {
                newChat = new ChatTable
                {
                    ChatID = ObjectId.GenerateNewId(),
                    ChatName = $"{selectedUser.FirstName} {selectedUser.LastName}",
                    Users = { App.RealmInstance.Find<UserTable>(currentUserObjectId)!, selectedUser }
                };
                App.RealmInstance.Add(newChat);
            });

            // Reload chats after new chat is created
            LoadChatsForUser();

            // Navigate to new chat if it was created
            if (newChat != null)
            {
                var currentUserName = Preferences.Get("CurrentUserName", "Unknown User");
                await Navigation.PushAsync(new ChatMessages(_chatService, MapToChat(newChat, currentUserObjectId), currentUserName));
            }
        }


        private async void OnChatSelected(object sender, SelectionChangedEventArgs e)
        {
            var currentUserName = Preferences.Get("CurrentUserName", "Unknown User");
            if (e.CurrentSelection.FirstOrDefault() is Chat selectedChat)
            {
                await Navigation.PushAsync(new ChatMessages(_chatService, selectedChat, currentUserName));
                ((CollectionView)sender).SelectedItem = null;
            }
        }

        private void OnMessageReceived(string user, string message)
        {
            var currentUserIdString = Preferences.Get("CurrentUserId", string.Empty);
            if (string.IsNullOrEmpty(currentUserIdString)) return;

            var currentUserId = ObjectId.Parse(currentUserIdString);
            var isUserMessage = user == Preferences.Get("CurrentUserName", "Unknown User");

            var chat = Chats.FirstOrDefault(c => c.Name == user) ?? new Chat
            {
                ChatId = ObjectId.GenerateNewId(),
                Name = user,
                Messages = new ObservableCollection<Message>(),
                LastMessagePreviews = message,
                UnreadCount = isUserMessage ? 0 : 1,
                LastMessageTimestamp = DateTimeOffset.UtcNow.ToLocalTime()
            };

            chat.Messages.Add(new Message
            {
                Sender = user,
                Text = message,
                Timestamp = DateTimeOffset.UtcNow.ToLocalTime(),
                IsRead = isUserMessage,
                IsUserMessage = isUserMessage
            });
            chat.LastMessagePreviews = message;

            // Increment UnreadCount only if the message is from another user
            if (!isUserMessage)
            {
                chat.UnreadCount++;
            }

            chat.LastMessageTimestamp = DateTimeOffset.UtcNow.ToLocalTime();

            App.RealmInstance?.Write(() =>
            {
                var chatTable = App.RealmInstance.Find<ChatTable>(chat.ChatId);
                if (chatTable == null)
                {
                    chatTable = new ChatTable
                    {
                        ChatID = chat.ChatId,
                        ChatName = user,
                        LastMessage = message,
                        Timestamp = DateTimeOffset.UtcNow.ToLocalTime(),
                        UnreadCount = isUserMessage ? 0 : 1, // Set unread count
                        Users = { App.RealmInstance.Find<UserTable>(currentUserId)! }
                    };
                    App.RealmInstance.Add(chatTable);
                }
                else
                {
                    chatTable.LastMessage = message;
                    chatTable.Timestamp = DateTimeOffset.UtcNow.ToLocalTime();
                    if (!isUserMessage)
                        chatTable.UnreadCount++;
                }
            });

            if (!Chats.Contains(chat))
                Chats.Add(chat);
        }

    }
}