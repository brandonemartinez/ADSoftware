using System;
using System.Collections.Generic;

namespace Data.Models
{
    public partial class Cliente
    {
        public Cliente()
        {
            Busqueda = new HashSet<Busqueda>();
        }

        public string Documento { get; set; }

        public virtual Usuario DocumentoNavigation { get; set; }
        public virtual ICollection<Busqueda> Busqueda { get; set; }
    }
}
