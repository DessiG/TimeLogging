﻿using System;
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
        public LoginWindow()
        {
            
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new TimeTrackingContext())
            {
                var employees = db.Employees.Where(em => (em.Username == userNameTextBox.Text
               && em.Password == passwordTextBox.Password)).FirstOrDefault();
                    
            }
        }
    }
}