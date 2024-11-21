namespace WorkerUnity.Services;
public class ChatService
{
    private HubConnection? _connection;

    public event Action<string, string>? MessageReceived;

    public async Task StartConnection()
    {
        var baseUrl = "https://10.0.2.2";

        try
        {
            //Connect to SignalR server
            _connection = new HubConnectionBuilder()
                .WithUrl($"{baseUrl}:5222/chatHub")
                .Build();

            _connection.On<string, string>("ReceiveMessage", (user, message) =>
            {
                //trigger OnMessageReceived even when message is received
                MessageReceived?.Invoke(user, message);
            });

            _connection.Closed += async (err0r) =>
            {
                await Task.Delay(2000);
                await StartConnection();
            };

            await _connection.StartAsync();
        }
        catch (Exception ex)
        {
            Debug.WriteLine($"SignalR connection error: {ex.Message}");
        }
    }

    public async Task SendMessage(string user, string message)
    {
        if (_connection != null && _connection.State == HubConnectionState.Connected)
        {
            await _connection.SendAsync("SendMessage", user, message);
        }
    }
}
