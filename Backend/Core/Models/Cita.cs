using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Cita
    {
        public Cita()
        {
            IdUsuarios = new HashSet<Usuario>();
        }

        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan HoraDesde { get; set; }
        public TimeSpan HoraHasta { get; set; }
        public bool? EstadoPago { get; set; }
        public bool? Calificado { get; set; }
        public string? Estado { get; set; }
        public string? Localidad { get; set; }
        public int IdCliente { get; set; }
        public int IdEspecialista { get; set; }

        public virtual ICollection<Usuario> IdUsuarios { get; set; }
    }
}
