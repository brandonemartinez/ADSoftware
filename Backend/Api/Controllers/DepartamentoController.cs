using Api.Resources.Department;
using Api.Resources.Especialist;
using AutoMapper;
using Core.Models;
using Core.Services;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class DepartamentoController : ControllerBase
    {
        private readonly IDepartamentoService _deparmentoService;
        private readonly IMapper _mapper;

        public DepartamentoController(IDepartamentoService deparmentoService, IMapper mapper)
        {
            _deparmentoService = deparmentoService;
            _mapper = mapper;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<DepartmentResourceListResponse>>> GetAll()
        {
            var departamentoCollection = await _deparmentoService.GetAll();
            if (departamentoCollection == null) return NotFound($"No se encontro ningun departamento");
            var especialistaResourcesListResponse = _mapper.Map<IEnumerable<Departamento>, IEnumerable<DepartmentResourceListResponse>>(departamentoCollection);
            return Ok(especialistaResourcesListResponse);
        }
    }
}
