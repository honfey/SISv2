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
    
    public partial class Sibling
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public string Name { get; set; }
        public Nullable<int> Age { get; set; }
        public string Gender { get; set; }
        public Nullable<int> HomePosition { get; set; }
        public string Occupation { get; set; }
        public Nullable<int> IC { get; set; }
        public Nullable<int> HandphoneNumber { get; set; }
        public string Email { get; set; }
        public Nullable<System.TimeSpan> cd { get; set; }
        public Nullable<int> cb { get; set; }
        public Nullable<System.TimeSpan> ud { get; set; }
        public Nullable<int> ub { get; set; }
        public Nullable<byte> st { get; set; }
    
        public virtual Student Student { get; set; }
    }
}