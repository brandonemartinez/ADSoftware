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
        public decimal Precio { get; set; }
        public int CantidadCiudades { get; set; }
        public string Nombre { get; set; } = null!;
        public int CantidadProfesiones { get; set; }

        public virtual ICollection<Especialista> Especialista { get; set; }
    }
}
