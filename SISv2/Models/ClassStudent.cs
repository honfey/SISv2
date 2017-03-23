//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class ClassStudent
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ClassStudent()
        {
            this.Attendance = new HashSet<Attendance>();
            this.CourseWork = new HashSet<CourseWork>();
            this.ReportCard = new HashSet<ReportCard>();
        }
    
        public int Id { get; set; }
        public Nullable<int> Course_ModuleId { get; set; }
        public Nullable<int> StudentId { get; set; }
        public Nullable<int> Day { get; set; }
        public Nullable<int> Exam_Day { get; set; }
        public Nullable<int> Trial_Day { get; set; }
        public Nullable<int> Project_Day { get; set; }
        public Nullable<bool> Status { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.TimeSpan> cd { get; set; }
        public Nullable<int> cb { get; set; }
        public Nullable<System.TimeSpan> ud { get; set; }
        public Nullable<int> ub { get; set; }
        public Nullable<byte> st { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Attendance> Attendance { get; set; }
        public virtual Course_Module Course_Module { get; set; }
        public virtual Student Student { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CourseWork> CourseWork { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReportCard> ReportCard { get; set; }
    }
}
