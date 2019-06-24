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
using System.Collections.ObjectModel;
using System.ComponentModel;

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

        private class JoinClass {
            public int TimeEntryId { get; set; }
            public System.DateTime TimeEntryCreated { get; set; }
            public decimal TimeEntryDuration { get; set; }
            public string TimeEntryDescription { get; set; }
            public DateTime? TimeEntryDate { get; set; }
            public int TimeEntryUserID { get; set; }
            public string TimeEntryUserName { get; set; }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            context.TimeEntries.Load();
            ObservableCollection<JoinClass> collection = new ObservableCollection<JoinClass>();


            var query = from te in context.TimeEntries
                        join user in context.Users on te.TimeEntryUserID equals user.UserID
                        select new JoinClass
                        {
                            TimeEntryCreated = te.TimeEntryCreated,
                            TimeEntryDuration = te.TimeEntryDuration,
                            TimeEntryDescription = te.TimeEntryDescription,
                            TimeEntryDate = te.TimeEntryDate,
                            TimeEntryUserName = user.UserName,
                            TimeEntryUserID = user.UserID
                        };

            foreach (var item in query)
            {
                collection.Add(item);
            }
            //  collection.GroupBy(t => t.TimeEntryDescription);
            ListCollectionView collectionView = new ListCollectionView(collection);
            collectionView.GroupDescriptions.Add(new PropertyGroupDescription("TimeEntryDescription"));

            this.timeEntriesDataGrid.ItemsSource = collectionView;
        }


        private void NewTimeLog_Click(object sender, RoutedEventArgs e)
        {
            var timeEntryWindow = new TimeEntry();
            timeEntryWindow.Show();
        }
    }
}
