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
    using System.Collections.ObjectModel;
    
    public partial class tbl_Tasks
    {
        public int TaskID { get; set; }
        public string TaskTitle { get; set; }
        public string TaskDescription { get; set; }
        public System.DateTime TaskCreationDate { get; set; }
        public bool TaskDisabled { get; set; }
        public decimal TaskEstimateDuration { get; set; }
        public System.DateTime TaskCompletionDate { get; set; }
        public int TaskCreatorID { get; set; }
        public int TaskUserID { get; set; }
    
        public virtual tbl_Users tbl_Users { get; set; }
    }
}