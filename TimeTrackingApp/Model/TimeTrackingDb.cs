using System.Data.Entity;

namespace TimeTrackingApp.Model
{
     public class TimeTrackingContext : DbContext
    {


        public TimeTrackingContext() : base("name=TimeTrackingEntities")
        {
          // Database.SetInitializer(new DropCreateDatabaseAlways<TimeTrackingContext>());
        }


        public DbSet<tbl_Users> Users { get; set; }
        public DbSet<tbl_Credentials> Credentials { get; set; }
      //  public DbSet<Task> Tasks { get; set; }
    }
}
