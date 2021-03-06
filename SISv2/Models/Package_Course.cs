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
    
    public partial class Package_Course
    {
        public int Id { get; set; }
        public int CourseId { get; set; }
        public Nullable<int> StudentId { get; set; }
        public Nullable<decimal> TotalPrice { get; set; }
        public Nullable<decimal> FirstPay { get; set; }
        public Nullable<int> MonthlyInterest { get; set; }
        public Nullable<decimal> TotalMonthlyP { get; set; }
        public Nullable<decimal> AfterPlnPay { get; set; }
        public Nullable<int> InterestRate { get; set; }
        public Nullable<decimal> MonthlyPayment { get; set; }
        public Nullable<decimal> TotalLeft { get; set; }
        public Nullable<System.DateTime> cd { get; set; }
        public string cb { get; set; }
        public Nullable<System.DateTime> ud { get; set; }
        public string ub { get; set; }
        public Nullable<byte> st { get; set; }
    
        public virtual Course Course { get; set; }
        public virtual Student Student { get; set; }
    }
}
