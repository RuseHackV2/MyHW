//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyHW_Teachers
{
    using System;
    using System.Collections.Generic;
    
    public partial class StudentsGroup
    {
        public int id { get; set; }
        public int studentId { get; set; }
        public int groupId { get; set; }
    
        public virtual Group Group { get; set; }
        public virtual Student Student { get; set; }
    }
}
