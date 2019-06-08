using System.Data.Entity;
using System.Data.Entity.Validation;

namespace TimeTrackingApp.Model
{
     public class TimeTrackingContext : DbContext
    {


        public TimeTrackingContext() : base("name=TimeTrackingEntities")
        {
          // Database.SetInitializer(new DropCreateDatabaseAlways<TimeTrackingContext>());
        }

        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = ex.EntityValidationErrors.GetType();
                //.SelectMany(x => x.ValidationErrors)


                // Join the list to a single string.
                var fullErrorMessage = string.Join(" ; ", errorMessages);

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

                // Throw a new DbEntityValidationException with the improved exception message.
                throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
            }
        }
        public DbSet<User> Users { get; set; }
        public DbSet<Task> Tasks { get; set; }
        public DbSet<TimeEntry> TimeEntries { get; set; }
    }
}
