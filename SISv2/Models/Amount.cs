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
    
    public partial class Amount
    {
        public int Id { get; set; }
        public Nullable<int> InvoiceId { get; set; }
        public string Description { get; set; }
        public Nullable<decimal> Amt { get; set; }
        public Nullable<decimal> GST { get; set; }
        public Nullable<decimal> GSTAmt { get; set; }
        public Nullable<decimal> Total { get; set; }
        public Nullable<decimal> FinalTotal { get; set; }
    
        public virtual Invoice Invoice { get; set; }
    }
}
