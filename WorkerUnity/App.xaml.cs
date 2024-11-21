
namespace WorkerUnity
{
    public partial class App : Application
    {
        public static Realm? RealmInstance;

        public App()
        {
            InitializeComponent();

            var config = new RealmConfiguration
            {
                SchemaVersion = 18, // Increment this each time you change the schema
                MigrationCallback = (migration, oldSchemaVersion) =>
                {
                    // If you need to perform any data migration for older versions, do it here.
                }
            };

            // Get instance with the updated configuration
            RealmInstance = Realm.GetInstance(config);

            MainPage = new AppShell();
        }
    }
}
