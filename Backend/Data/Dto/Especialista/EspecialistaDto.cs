using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Dto.Especialista
{
    public class EspecialistaDto
    {
        public int? Id { get; set; }
        public string RazonSocial { get; set; } = null!;
        public string NombreFantasia { get; set; } = null!;
        public string Presentacion { get; set; } = null!;
        public int? Calificacion { get; set; }
        public string? RangoDia { get; set; }
        public TimeSpan? HoraDesde { get; set; }
        public TimeSpan? HoraHasta { get; set; }
        public string? DepartamentoDisponible { get; set; }
    }
}
