using Newtonsoft.Json;
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

        public RegistroAuditoria()
        {

        }
        public RegistroAuditoria(string token, string nombreTabla, object valores)
        {
            Token = token;
            FechaEvento = DateTime.Now;
            NombreTabla = nombreTabla;
            Valores = JsonConvert.SerializeObject
            (
            valores,
            Formatting.Indented,
            new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            }
            );
        }
    }
}
