//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Mobit.Data.Context
{
    using System;
    using System.Collections.Generic;
    
    public partial class Adminler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Adminler()
        {
            this.AdminRolIliski = new HashSet<AdminRolIliski>();
        }
    
        public int AdminId { get; set; }
        public string AdSoyad { get; set; }
        public string Mail { get; set; }
        public string Sifre { get; set; }
        public bool Aktif { get; set; }
        public bool Owner { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AdminRolIliski> AdminRolIliski { get; set; }
    }
}
