using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class Ciudad
    {
        public string Ciudad1 { get; set; }
        public int IdDepartamento { get; set; }

        public virtual Departamento IdDepartamentoNavigation { get; set; }
    }
}
