using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Oficio
    {
        public Oficio()
        {
            IdEspecialista = new HashSet<Especialista>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; } = null!;

        public virtual ICollection<Especialista> IdEspecialista { get; set; }
    }
}
