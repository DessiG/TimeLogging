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
using TimeTrackingApp.Model;
using System.Data;
using System.Data.Entity;

namespace TimeTrackingApp
{
    /// <summary>
    /// Interaction logic for TimeLoggingReport.xaml
    /// </summary>
    public partial class TimeLoggingReport : Window
    {
        TimeTrackingEntities context = new TimeTrackingEntities();

        public TimeLoggingReport()
        {
            InitializeComponent();
            DataContext = this;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            context.TimeEntries.Load();
            this.timeEntriesDataGrid.ItemsSource = context.TimeEntries.Local;
        }


        private void NewTimeLog_Click(object sender, RoutedEventArgs e)
        {
            var timeEntryWindow = new TimeEntry();
            timeEntryWindow.Show();
        }
    }
}
