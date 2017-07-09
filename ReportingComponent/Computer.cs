//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReportingComponent
{
    using System;
    using System.Collections.Generic;
    
    public partial class Computer
    {
        public Computer()
        {
            this.SoftPkg = new HashSet<SoftPkg>();
        }
    
        public int computerID { get; set; }
        public int userId { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string OS { get; set; }
        public string RAM { get; set; }
        public string HDD { get; set; }
        public string Processor { get; set; }
        public string NoSerie { get; set; }
        public string NoSerieBat { get; set; }
        public string NoSerieCarg { get; set; }
        public string Proveedor { get; set; }
        public int Price { get; set; }
        public System.DateTime DeliveryDate { get; set; }
        public System.DateTime AcquisitionDate { get; set; }
    
        public virtual User User { get; set; }
        public virtual ICollection<SoftPkg> SoftPkg { get; set; }
    }
}