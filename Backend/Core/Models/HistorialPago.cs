using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class HistorialPago
    {
        public HistorialPago()
        {
            IdUsuarios = new HashSet<Usuario>();
        }

        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Monto { get; set; }
        public string Concepto { get; set; }

        public virtual ICollection<Usuario> IdUsuarios { get; set; }
    }
}
