using System.Windows;
using TimeTrackingApp.Model;
using System.Linq;

namespace TimeTrackingApp
{
    /// <summary>
    /// Interaction logic for TimeEntry.xaml
    /// </summary>
    public partial class TimeEntry : Window
    {
        TimeTrackingEntities context = new TimeTrackingEntities();

        public TimeEntry()
        {

            InitializeComponent();
            DataContext = this;
        }


        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {



        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            var userId = 0;
            if (timeEntryUserIDTextBox.Text != null) {
                var user = context.Users.Where(us => (us.UserName == timeEntryUserIDTextBox.Text)).FirstOrDefault();
                //userId = user[0].UserId;
            }

            TimeTrackingApp.Model.TimeEntry newTimeEntry = new TimeTrackingApp.Model.TimeEntry
            {
                TimeEntryDuration = decimal.Parse(timeEntryDurationTextBox.Text),
                TimeEntryDescription = timeEntryDescriptionTextBox.Text,
                TimeEntryDate = timeEntryDateDatePicker.SelectedDate.Value.Date
                //TimeEntryUserID = userid
            };

            context.TimeEntries.Add(newTimeEntry);
            context.SaveChanges();
        }
    }
}
