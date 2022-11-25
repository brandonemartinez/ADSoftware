namespace Core.Models
{
    public partial class Especialista
    {
        public Especialista()
        {
            Archivos = new HashSet<Archivo>();
            IdOficios = new HashSet<Oficio>();
        }

        public int Id { get; set; }
        public string RazonSocial { get; set; } = null!;
        public string Rut { get; set; } = null!;
        public string NombreFantasia { get; set; } = null!;
        public string? Presentacion { get; set; }
        public int? Calificacion { get; set; }
        public string? RangoDia { get; set; }
        public TimeSpan? HoraDesde { get; set; }
        public TimeSpan? HoraHasta { get; set; }
        public string? DepartamentoDisponible { get; set; }
        public int IdPaquete { get; set; }
        public DateTime ExpiracionPlan { get; set; }

        public virtual Usuario IdNavigation { get; set; } = null!;
        public virtual Paquete IdPaqueteNavigation { get; set; } = null!;
        public virtual ICollection<Archivo> Archivos { get; set; } = null!;

        public virtual ICollection<Oficio> IdOficios { get; set; }
    }
}
