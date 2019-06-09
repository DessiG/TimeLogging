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

namespace TimeTrackingApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void UserRegistrationBtn_Click(object sender, RoutedEventArgs e)
        {
            var usersListForm = new UsersList();
            usersListForm.Show();
           // this.Close();
        }

        private void TimeLoggingBtn_Click(object sender, RoutedEventArgs e)
        {
            var timeLoggingReport = new TimeLoggingReport();
            timeLoggingReport.Show();
          //  this.Close();
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }
    }   
}
