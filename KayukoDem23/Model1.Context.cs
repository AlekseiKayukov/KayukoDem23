﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KayukoDem23
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class KayukovDem23Entities : DbContext
    {
        public KayukovDem23Entities()
            : base("name=KayukovDem23Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<Client> Client { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<HistoryEmployee> HistoryEmployee { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<Post> Post { get; set; }
        public virtual DbSet<Service> Service { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<Street> Street { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TypeInput> TypeInput { get; set; }
        public virtual DbSet<EmployeeView> EmployeeView { get; set; }
        public virtual DbSet<OrderView> OrderView { get; set; }
        public virtual DbSet<ClientView> ClientView { get; set; }
        public virtual DbSet<ServiceandOrder> ServiceandOrder { get; set; }
    }
}
