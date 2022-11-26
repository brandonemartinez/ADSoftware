using Dtos.Dto.Departamento;

namespace Api.Resources.Department
{
    public class DepartmentResourceListResponse
    {
        public int Id { get; set; }
        public string Departamento { get; set; }
        public List<CiudadDto> Ciudades { get; set; }
    }
}
