using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Especialista
    {
        public Especialista()
        {
            Disponibilidads = new HashSet<Disponibilidad>();
            OficioEspecialista = new HashSet<OficioEspecialista>();
        }

        public string Documento { get; set; }
        public string RazonSocial { get; set; }
        public string Fotos { get; set; }
        public int? Calificacion { get; set; }
        public int IdPlanes { get; set; }

        public virtual Usuario DocumentoNavigation { get; set; }
        public virtual Plane IdPlanesNavigation { get; set; }
        public virtual ICollection<Disponibilidad> Disponibilidads { get; set; }
        public virtual ICollection<OficioEspecialista> OficioEspecialista { get; set; }
    }
}
