﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MyHWEntities : DbContext
    {
        public MyHWEntities()
            : base("name=MyHWEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<CommentsFan> CommentsFans { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<GroupsTask> GroupsTasks { get; set; }
        public virtual DbSet<Homework> Homeworks { get; set; }
        public virtual DbSet<HomeworksComment> HomeworksComments { get; set; }
        public virtual DbSet<HomeworksFan> HomeworksFans { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<StudentsGroup> StudentsGroups { get; set; }
        public virtual DbSet<StudentsHomework> StudentsHomeworks { get; set; }
        public virtual DbSet<Task> Tasks { get; set; }
        public virtual DbSet<Teacher> Teachers { get; set; }
        public virtual DbSet<TeachersGroup> TeachersGroups { get; set; }
    }
}