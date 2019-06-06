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
using System.Windows.Navigation;
using System.Windows.Shapes;
using TimeTrackingApp.Model;

namespace TimeTrackingApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        TimeTrackingContext context = new TimeTrackingContext();
        CollectionViewSource loginViewSource;
        //public MainWindow()
        //{
        //    InitializeComponent();
        //    custViewSource = ((CollectionViewSource)(FindResource("customerViewSource")));
        //    ordViewSource = ((CollectionViewSource)(FindResource("customerOrdersViewSource")));
        //    DataContext = this;
        //}
        public LoginWindow()
        {
            InitializeComponent();
            //loginViewSource = ((CollectionViewSource)(FindResource("loginViewSource")));
            DataContext = this;
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {

            var userRegisterForm = new UserRegistration();
            var user = context.Credentials.Where(em => (em.Email == emailTextBox.Text
               && em.Password == passwordTextBox.Password)).FirstOrDefault();

            if (user != null) {
                userRegisterForm.Show();
                this.Close();
            }
            
        }
    }
}
