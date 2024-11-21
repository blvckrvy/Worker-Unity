namespace WorkerUnitySignalRServer.Hubs;

public class ChatHub : Hub
{
    public async Task SendMessage(string user, string message)
    {
        //sends message to everyone connected
        await Clients.All.SendAsync("ReceiveMessage", user, message);
    }
}
