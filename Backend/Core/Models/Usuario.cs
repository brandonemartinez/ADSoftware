using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            Busqueda = new HashSet<Busqueda>();
            IdCita = new HashSet<Cita>();
            IdHistorialPagos = new HashSet<HistorialPago>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public string Apellido { get; set; } = null!;
        public string NombreUsuario { get; set; } = null!;
        public string Contrasenia { get; set; } = null!;
        public string Correo { get; set; } = null!;
        public string Telefono { get; set; } = null!;
        public string? Direccion { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string? Genero { get; set; }
        public bool? Activo { get; set; }
        public string Rol { get; set; } = null!;
        public int IdDepartamento { get; set; }

        public virtual Departamento IdDepartamentoNavigation { get; set; } = null!;
        public virtual Especialista Especialista { get; set; } = null!;
        public virtual ICollection<Busqueda> Busqueda { get; set; }

        public virtual ICollection<Cita> IdCita { get; set; }
        public virtual ICollection<HistorialPago> IdHistorialPagos { get; set; }
    }
}
