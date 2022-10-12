using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Cita
    {
        public Cita()
        {
            Documentos = new HashSet<Usuario>();
        }

        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan Hora { get; set; }
        public bool? EstadoPago { get; set; }
        public string Estado { get; set; }

        public virtual ICollection<Usuario> Documentos { get; set; }
    }
}
