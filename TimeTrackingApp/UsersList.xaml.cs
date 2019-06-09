using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.Entity;
using TimeTrackingApp.Model;

namespace TimeTrackingApp
{
    /// <summary>
    /// Interaction logic for UsersList.xaml
    /// </summary>
    public partial class UsersList : Window
    {
        TimeTrackingEntities context = new TimeTrackingEntities();
        CollectionViewSource userViewSource;

        public UsersList()
        {
            InitializeComponent();
           // userViewSource = ((CollectionViewSource)(FindResource("userViewSource")));
            DataContext = this;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            // Load is an extension method on IQueryable,    
            // defined in the System.Data.Entity namespace.   
            // This method enumerates the results of the query,    
            // similar to ToList but without creating a list.   
            // When used with Linq to Entities, this method    
            // creates entity objects and adds them to the context.   
            context.Users.Load();

            // After the data is loaded, call the DbSet<T>.Local property    
            // to use the DbSet<T> as a binding source.   
            this.userDataGrid.ItemsSource = context.Users.Local;
            //userViewSource.Source = context.Users.Local;
        }

        private void NewUserBtn_Click(object sender, RoutedEventArgs e)
        {
            var userRegistration = new UserRegistration();
            userRegistration.Show();
        }
    }
}
