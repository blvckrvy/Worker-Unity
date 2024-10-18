

namespace Worker_Unity
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(WorkerPage), typeof(WorkerPage));
        }
    }
}
