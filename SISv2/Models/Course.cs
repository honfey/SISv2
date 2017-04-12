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
    
    public partial class Course
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Course()
        {
            this.Intake = new HashSet<Intake>();
            this.Package_Course = new HashSet<Package_Course>();
        }
    
        public int Id { get; set; }
        public string CourseCode { get; set; }
        public Nullable<int> PackageId { get; set; }
        public string Name { get; set; }
        public Nullable<System.DateTime> cd { get; set; }
        public string cb { get; set; }
        public Nullable<System.DateTime> ud { get; set; }
        public string ub { get; set; }
        public Nullable<byte> st { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Intake> Intake { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Package_Course> Package_Course { get; set; }
    }
}
