using System.Data.Entity;

namespace TimeTrackingApp.Model
{
     public class TimeTrackingContext : DbContext
    {


        public TimeTrackingContext() : base("TimeTrackingDb")
        {
            Database.SetInitializer(new DropCreateDatabaseAlways<TimeTrackingContext>());
        }


        public DbSet<Employee> Employees { get; set; }
        public DbSet<Task> Tasks { get; set; }
    }
}
