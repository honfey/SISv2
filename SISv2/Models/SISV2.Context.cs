﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SISv2.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SISV2Entities : DbContext
    {
        public SISV2Entities()
            : base("name=SISV2Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Package> Package { get; set; }
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<Address> Address { get; set; }
        public virtual DbSet<Amount> Amount { get; set; }
        public virtual DbSet<Attendance> Attendance { get; set; }
        public virtual DbSet<ClassStudent> ClassStudent { get; set; }
        public virtual DbSet<Course> Course { get; set; }
        public virtual DbSet<Course_Module> Course_Module { get; set; }
        public virtual DbSet<CourseWork> CourseWork { get; set; }
        public virtual DbSet<Guardian> Guardian { get; set; }
        public virtual DbSet<Image> Image { get; set; }
        public virtual DbSet<Intake> Intake { get; set; }
        public virtual DbSet<Invoice> Invoice { get; set; }
        public virtual DbSet<MarkType> MarkType { get; set; }
        public virtual DbSet<Module> Module { get; set; }
        public virtual DbSet<ModuleStandard> ModuleStandard { get; set; }
        public virtual DbSet<Month> Month { get; set; }
        public virtual DbSet<Nationality> Nationality { get; set; }
        public virtual DbSet<Package_Course> Package_Course { get; set; }
        public virtual DbSet<Parent> Parent { get; set; }
        public virtual DbSet<ReportCard> ReportCard { get; set; }
        public virtual DbSet<Sibling> Sibling { get; set; }
        public virtual DbSet<SPMResult> SPMResult { get; set; }
        public virtual DbSet<Student> Student { get; set; }
        public virtual DbSet<Subject> Subject { get; set; }
        public virtual DbSet<TestType> TestType { get; set; }
        public virtual DbSet<Trainer> Trainer { get; set; }
        public virtual DbSet<Year> Year { get; set; }
    }
}
