using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Disponibilidad
    {
        public Disponibilidad()
        {
            IdDepartamentos = new HashSet<Departamento>();
        }

        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan Hora { get; set; }
        public string Documento { get; set; }

        public virtual Especialista DocumentoNavigation { get; set; }

        public virtual ICollection<Departamento> IdDepartamentos { get; set; }
    }
}
