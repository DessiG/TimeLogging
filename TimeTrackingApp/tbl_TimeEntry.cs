//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TimeTrackingApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_TimeEntry
    {
        public int TimeEntryId { get; set; }
        public System.DateTime TimeEntryCreated { get; set; }
        public decimal TimeEntryDuration { get; set; }
        public string TimeEntryDescription { get; set; }
        public System.DateTime TimeEntryDate { get; set; }
        public int TimeEntryUserID { get; set; }
    
        public virtual tbl_Users tbl_Users { get; set; }
    }
}
