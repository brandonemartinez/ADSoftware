using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class OficioEspecialista
    {
        public string Documento { get; set; }
        public int IdOficio { get; set; }
        public string Certificaciones { get; set; }

        public virtual Especialista DocumentoNavigation { get; set; }
        public virtual Oficio IdOficioNavigation { get; set; }
    }
}
