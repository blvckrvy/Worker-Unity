namespace WorkerUnity.Converters;

public class MessageBackgroundConverter : IValueConverter
{
    public object Convert(object? value, Type? targetType, object? parameter, CultureInfo culture)
    {
        bool isUserMessage = (bool)value!;
        return isUserMessage ? Colors.LightGreen : Colors.LightGray;
    }

    public object ConvertBack(object? value, Type? targetType, object? parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}