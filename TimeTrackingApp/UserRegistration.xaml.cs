using System.Windows;
using System.Windows.Data;
using System.Data.Entity;

namespace TimeTrackingApp
{
    /// <summary>
    /// Interaction logic for UserRegistration.xaml
    /// </summary>
    public partial class UserRegistration : Window
    {
        TimeTrackingEntities context = new TimeTrackingEntities();
        CollectionViewSource tbl_UsersViewSource;
        CollectionViewSource credentialsViewSource;     

        public UserRegistration()
        {
            InitializeComponent();
            tbl_UsersViewSource = ((CollectionViewSource)(FindResource("tbl_UsersViewSource")));
            credentialsViewSource = ((CollectionViewSource)(FindResource("tbl_CredentialsViewSource")));
            DataContext = this;

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            //TimeTrackingApp.TimeTrackingDataSet timeTrackingDataSet = ((TimeTrackingApp.TimeTrackingDataSet)(this.FindResource("timeTrackingDataSet")));
            //// Load data into the table tbl_Users. You can modify this code as needed.
            //TimeTrackingApp.TimeTrackingDataSetTableAdapters.tbl_UsersTableAdapter timeTrackingDataSettbl_UsersTableAdapter = new TimeTrackingApp.TimeTrackingDataSetTableAdapters.tbl_UsersTableAdapter();
            //System.Windows.Data.CollectionViewSource tbl_UsersViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("tbl_UsersViewSource")));
            //tbl_UsersViewSource.View.MoveCurrentToFirst();
            //// Load data into the table tbl_Credentials. You can modify this code as needed.
            //TimeTrackingApp.TimeTrackingDataSetTableAdapters.tbl_CredentialsTableAdapter timeTrackingDataSettbl_CredentialsTableAdapter = new TimeTrackingApp.TimeTrackingDataSetTableAdapters.tbl_CredentialsTableAdapter();
            //timeTrackingDataSettbl_CredentialsTableAdapter.Fill(timeTrackingDataSet.tbl_Credentials);
            //System.Windows.Data.CollectionViewSource tbl_CredentialsViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("tbl_CredentialsViewSource")));
            //tbl_CredentialsViewSource.View.MoveCurrentToFirst();

            context.tbl_Users.Load();
            tbl_UsersViewSource.Source = context.tbl_Users.Local;
           // context.tbl_Credentials.Load();
            
           // credentialsViewSource.Source = context.tbl_Credentials.Local;
           
        }
    }
}
