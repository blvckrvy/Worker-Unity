namespace WorkerUnity.Converters;

public class TimestampAlignmentConverter : IValueConverter
{
    public object Convert(object? value, Type? targetType, object? parameter, CultureInfo? culture)
    {
        return (value as bool?) == true ? LayoutOptions.End : LayoutOptions.Start;
    }

    public object ConvertBack(object? value, Type? targetType, object? parameter, CultureInfo? culture)
    {
        throw new NotImplementedException();
    }
}