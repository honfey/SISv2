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
    
    public partial class Student
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Student()
        {
            this.Addresses = new HashSet<Address>();
            this.ClassStudents = new HashSet<ClassStudent>();
            this.Invoices = new HashSet<Invoice>();
            this.Package_Course = new HashSet<Package_Course>();
            this.ReportCards = new HashSet<ReportCard>();
            this.Siblings = new HashSet<Sibling>();
            this.SPMResults = new HashSet<SPMResult>();
        }
    
        public int Id { get; set; }
        public string StudentId { get; set; }
        public Nullable<int> IntakeId { get; set; }
        public Nullable<int> SPMResultId { get; set; }
        public Nullable<bool> Insurence { get; set; }
        public string Name { get; set; }
        public Nullable<int> Age { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public long IC { get; set; }
        public Nullable<int> NationalityId { get; set; }
        public string Gender { get; set; }
        public string Status { get; set; }
        public string PhoneNum { get; set; }
        public string OtherPhoneNum { get; set; }
        public string EmailAddress { get; set; }
        public string Religion { get; set; }
        public string SingleParent { get; set; }
        public string StudentPicture { get; set; }
        public string MomName { get; set; }
        public string MomEdu { get; set; }
        public string MomWorkStatus { get; set; }
        public string MomJob { get; set; }
        public string MomFeildWork { get; set; }
        public string MomSectorJob { get; set; }
        public Nullable<decimal> MomSalary { get; set; }
        public string FatherName { get; set; }
        public string FatherEdu { get; set; }
        public string FatherWorkStatus { get; set; }
        public string FatherJob { get; set; }
        public string FatherFeildWork { get; set; }
        public string FatherSectorJob { get; set; }
        public Nullable<decimal> FatherSalary { get; set; }
        public Nullable<int> NumSibling { get; set; }
        public Nullable<int> BirthOrd { get; set; }
        public Nullable<System.TimeSpan> cd { get; set; }
        public Nullable<int> cb { get; set; }
        public Nullable<System.TimeSpan> ud { get; set; }
        public Nullable<int> ub { get; set; }
        public Nullable<byte> st { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Address> Addresses { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClassStudent> ClassStudents { get; set; }
        public virtual Intake Intake { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices { get; set; }
        public virtual Nationality Nationality { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Package_Course> Package_Course { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReportCard> ReportCards { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sibling> Siblings { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SPMResult> SPMResults { get; set; }
    }
}
