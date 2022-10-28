using System;
using System.Collections.Generic;

namespace Core.Models
{
    public partial class RegistroAuditoria
    {
        public int Id { get; set; }
        public string? Token { get; set; }
        public DateTime? FechaEvento { get; set; }
        public string? NombreTabla { get; set; }
        public string? Valores { get; set; }
    }
}
