using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Especialista
    {
        public Especialista()
        {
            OficioEspecialista = new HashSet<OficioEspecialista>();
        }

        public int Id { get; set; }
        public string RazonSocial { get; set; } = null!;
        public string NombreFantasia { get; set; } = null!;
        public string Fotos { get; set; } = null!;
        public int? Calificacion { get; set; }
        public string? RangoDia { get; set; }
        public TimeSpan? HoraDesde { get; set; }
        public TimeSpan? HoraHasta { get; set; }
        public string? DepartamentoDisponible { get; set; }
        public int IdPaquete { get; set; }

        public virtual Usuario IdNavigation { get; set; } = null!;
        public virtual Paquete IdPaqueteNavigation { get; set; } = null!;
        public virtual ICollection<OficioEspecialista> OficioEspecialista { get; set; }
    }
}
