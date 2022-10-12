using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Busqueda
    {
        public int Id { get; set; }
        public int? CantidadResultados { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan Hora { get; set; }
        public string Oficio { get; set; }
        public int? IdDepartamento { get; set; }
        public string DocumentoCliente { get; set; }

        public virtual Cliente DocumentoClienteNavigation { get; set; }
        public virtual Departamento IdDepartamentoNavigation { get; set; }
    }
}
