using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class OficioEspecialista
    {
        public int IdEspecialista { get; set; }
        public int IdOficio { get; set; }

        public virtual Especialista IdEspecialistaNavigation { get; set; } = null!;
        public virtual Oficio IdOficioNavigation { get; set; } = null!;
    }
}
