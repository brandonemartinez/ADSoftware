using System;
using System.Collections.Generic;

namespace Data.Models
{
    public partial class Oficio
    {
        public Oficio()
        {
            OficioEspecialista = new HashSet<OficioEspecialista>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<OficioEspecialista> OficioEspecialista { get; set; }
    }
}
