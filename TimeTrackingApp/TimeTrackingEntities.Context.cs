﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TimeTrackingEntities : DbContext
    {
        public TimeTrackingEntities()
            : base("name=TimeTrackingEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tbl_Credentials> tbl_Credentials { get; set; }
        public virtual DbSet<tbl_Roles> tbl_Roles { get; set; }
        public virtual DbSet<tbl_Tasks> tbl_Tasks { get; set; }
        public virtual DbSet<tbl_TimeEntry> tbl_TimeEntry { get; set; }
        public virtual DbSet<tbl_Users> tbl_Users { get; set; }
    }
}