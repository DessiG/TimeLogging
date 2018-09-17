using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeTrackingApp.Model
{
    public class Task
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public double LoggedHours { get; set; }
        public DateTime CreatedDate { get; set; }
        public int EmployeeID { get; set; }
    }
}
