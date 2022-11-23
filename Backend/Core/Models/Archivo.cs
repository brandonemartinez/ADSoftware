using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Models
{
    public partial class Archivo
    {
        public int? Id { get; set; }
        public bool FotoPerfil { get; set; }
        public byte[] DataArchivo { get; set; }
    }
}
