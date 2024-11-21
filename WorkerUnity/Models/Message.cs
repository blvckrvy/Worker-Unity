namespace WorkerUnity.Models;
public class Message
{
    public string? Sender { get; set; }
    public string? Text { get; set; }
    public DateTimeOffset Timestamp { get; set; }
    public bool IsRead { get; set; } = false;
    public bool IsUserMessage { get; set; } = false;
}
