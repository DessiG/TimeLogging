using System.Windows;

namespace TimeTrackingApp
{
    /// <summary>
    /// Interaction logic for TimeEntry.xaml
    /// </summary>
    public partial class TimeEntry : Window
    {
        public TimeEntry()
        {
            InitializeComponent();
        }


        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {

            TimeTrackingApp.TimeTrackingDataSet timeTrackingDataSet = ((TimeTrackingApp.TimeTrackingDataSet)(this.FindResource("timeTrackingDataSet")));
            // Load data into the table tbl_TimeEntry. You can modify this code as needed.
            TimeTrackingApp.TimeTrackingDataSetTableAdapters.tbl_TimeEntryTableAdapter timeTrackingDataSettbl_TimeEntryTableAdapter = new TimeTrackingApp.TimeTrackingDataSetTableAdapters.tbl_TimeEntryTableAdapter();
            timeTrackingDataSettbl_TimeEntryTableAdapter.Fill(timeTrackingDataSet.tbl_TimeEntry);
            System.Windows.Data.CollectionViewSource tbl_TimeEntryViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("tbl_TimeEntryViewSource")));
            tbl_TimeEntryViewSource.View.MoveCurrentToFirst();
        }
    }
}
