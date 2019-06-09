using System.Windows;
using System.Windows.Data;
using System.Data.Entity;
using System;
using TimeTrackingApp.Model;

namespace TimeTrackingApp
{
    /// <summary>
    /// Interaction logic for UserRegistration.xaml
    /// </summary>
    public partial class UserRegistration : Window
    {
        TimeTrackingEntities context = new TimeTrackingEntities();
        CollectionViewSource UsersViewSource;
        CollectionViewSource credentialsViewSource;     

        public UserRegistration()
        {
            InitializeComponent();
            //UsersViewSource = ((CollectionViewSource)(FindResource("UsersViewSource")));
            //credentialsViewSource = ((CollectionViewSource)(FindResource("tbl_CredentialsViewSource")));
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

            //context.Users.Load();
           // tbl_UsersViewSource.Source = context.tbl_Users.Local;
           // context.tbl_Credentials.Load();
            
           // credentialsViewSource.Source = context.tbl_Credentials.Local;
           
        }

        private void SubmitBtn_Click(object sender, RoutedEventArgs e)
        {
            
            User newUser = new User { 
                UserName = userNameTextBox.Text ,
                FirstName = firstNameTextBox.Text,
                LastName = lastNameTextBox.Text,
                Email = emailTextBox.Text,
                Phone = phoneTextBox.Text,
                CreatedDate = DateTime.Now,
                LastLoginDate = DateTime.Now
            };

            
                if (passwordTextBox.Text.Equals(verifyPasswordTextBox.Text))
                {
                    newUser.Password = passwordTextBox.Text;
                    context.Users.Add(newUser);
                    context.SaveChanges();
                    var userList = new UsersList();
                    userList.userDataGrid.Items.Refresh();
                    this.Close();
                }
                
        }
        


    }
}
