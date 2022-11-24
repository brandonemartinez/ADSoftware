using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Paquete
    {
        public Paquete()
        {
            Especialista = new HashSet<Especialista>();
        }

        public int Id { get; set; }
        public decimal PrecioMensual { get; set; }
        public decimal PrecioAnual { get; set; }
        public int CantidadCiudades { get; set; }
        public string Nombre { get; set; } = null!;
        public int CantidadProfesiones { get; set; }
        public string Descripcion { get; set; } = null!;

        public virtual ICollection<Especialista> Especialista { get; set; }
    }
}
