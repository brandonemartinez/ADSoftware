using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Busqueda
    {
        public int Id { get; set; }
        public int? CantidadResultado { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan Hora { get; set; }
        public string? Oficio { get; set; }
        public int? IdDepartamento { get; set; }
        public int? IdCliente { get; set; }

        public virtual Usuario? IdClienteNavigation { get; set; }
        public virtual Departamento? IdDepartamentoNavigation { get; set; }
    }
}
