namespace WorkerUnity.Converters;

public class MessageAlignmentConverter : IValueConverter
{
    public object Convert(object? value, Type? targetType, object? parameter, CultureInfo culture)
    {
        bool isUserMessage = (bool)value!;
        return isUserMessage ? LayoutOptions.End : LayoutOptions.Start;
    }

    public object ConvertBack(object? value, Type? targetType, object? parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}

