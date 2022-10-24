using Dtos.Dto.Departamento;

namespace Api.Resources.Department
{
    public class DepartmentResourceListResponse
    {
        public string Departamento { get; set; }
        public List<CiudadDto> Ciudades { get; set; }
    }
}
