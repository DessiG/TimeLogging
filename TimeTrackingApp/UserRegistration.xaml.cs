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
    /// Interaction logic for UserRegistration.xaml
    /// </summary>
    public partial class UserRegistration : Window
    {
        public UserRegistration()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            TimeTrackingApp.TimeTrackingDataSet timeTrackingDataSet = ((TimeTrackingApp.TimeTrackingDataSet)(this.FindResource("timeTrackingDataSet")));
            // Load data into the table tbl_Users. You can modify this code as needed.
            TimeTrackingApp.TimeTrackingDataSetTableAdapters.tbl_UsersTableAdapter timeTrackingDataSettbl_UsersTableAdapter = new TimeTrackingApp.TimeTrackingDataSetTableAdapters.tbl_UsersTableAdapter();
            timeTrackingDataSettbl_UsersTableAdapter.Fill(timeTrackingDataSet.tbl_Users);
            System.Windows.Data.CollectionViewSource tbl_UsersViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("tbl_UsersViewSource")));
            tbl_UsersViewSource.View.MoveCurrentToFirst();
        }
    }
}
