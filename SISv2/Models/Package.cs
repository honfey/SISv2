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
    
    public partial class Package
    {
        public int PackageId { get; set; }
        public Nullable<int> PaymentPlan { get; set; }
        public Nullable<int> LoanPercent { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public string SaleComfirmation { get; set; }
        public Nullable<System.TimeSpan> cd { get; set; }
        public Nullable<int> cb { get; set; }
        public Nullable<System.TimeSpan> ud { get; set; }
        public Nullable<int> ub { get; set; }
        public Nullable<byte> st { get; set; }
    }
}
