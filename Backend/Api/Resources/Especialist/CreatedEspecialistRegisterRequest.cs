using Dtos.Dto.Especialista;

namespace Api.Resources.Especialist
{
    public class CreatedEspecialistRegisterRequest
    {
        public int IdUsuario { get; set; }
        public string RazonSocial { get; set; }
        public string NombreFantasia { get; set; }
        public string RangoDia { get; set; }
        public int HoraDesde { get; set; }
        public int HoraHasta { get; set; }
        public string DepartamentoDisponible { get; set; }
        public string Fotos { get; set; }
        public string FotoPerfil { get; set; }
        public string Presentacion { get; set; }
        public int idPaquete { get; set; }
        public List<OficioEspecialistaDto> Oficios { get; set; }
    }
}
