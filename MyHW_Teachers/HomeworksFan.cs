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
    
    public partial class HomeworksFan
    {
        public int id { get; set; }
        public int homeworkId { get; set; }
        public int fanId { get; set; }
    
        public virtual Homework Homework { get; set; }
        public virtual Student Student { get; set; }
        public virtual Teacher Teacher { get; set; }
    }
}
