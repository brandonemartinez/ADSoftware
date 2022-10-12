using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            IdCita = new HashSet<Cita>();
            IdHistorialPagos = new HashSet<HistorialPago>();
        }

        public string Documento { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string User { get; set; }
        public string Contrasenia { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public int IdDepartamento { get; set; }

        public virtual Departamento IdDepartamentoNavigation { get; set; }
        public virtual Cliente Cliente { get; set; }
        public virtual Especialista Especialista { get; set; }

        public virtual ICollection<Cita> IdCita { get; set; }
        public virtual ICollection<HistorialPago> IdHistorialPagos { get; set; }
    }
}
