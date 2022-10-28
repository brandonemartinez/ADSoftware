using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Oficio
    {
        public Oficio()
        {
            OficioEspecialista = new HashSet<OficioEspecialista>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; } = null!;

        public virtual ICollection<OficioEspecialista> OficioEspecialista { get; set; }
    }
}
