using System;
using System.Collections.Generic;

namespace Data.Models
{
    public partial class Departamento
    {
        public Departamento()
        {
            Busqueda = new HashSet<Busqueda>();
            Ciudads = new HashSet<Ciudad>();
            Usuarios = new HashSet<Usuario>();
            IdDisponibilidads = new HashSet<Disponibilidad>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Busqueda> Busqueda { get; set; }
        public virtual ICollection<Ciudad> Ciudads { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }

        public virtual ICollection<Disponibilidad> IdDisponibilidads { get; set; }
    }
}
