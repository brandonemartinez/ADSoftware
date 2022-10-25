using Api.Resources.Especialist;
using AutoMapper;
using Core.Models;
using Core.Services;
using Dtos.Dto.Especialista;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class EspecialistaController : ControllerBase
    {
        private readonly IEspecialistaService _especialistaService;
        private readonly IMapper _mapper;

        public EspecialistaController(
            IEspecialistaService especialistaService,
            IMapper mapper
            )
        {
            _especialistaService = especialistaService;
            _mapper = mapper;
        }
        /// <summary>
        /// Obtener a todos los Especialistas sin ningun filtro
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<EspecialistaResourceListResponse>>> GetAll()
        {
            var especialsitaCollection = await _especialistaService.GetAll();
            if (especialsitaCollection == null) return NotFound($"No se encontro ningun especialista");
            var especialistaResourcesListResponse = _mapper.Map<IEnumerable<Especialista>, IEnumerable<EspecialistaResourceListResponse>>(especialsitaCollection);
            return Ok(especialistaResourcesListResponse);
        }
        /// <summary>
        /// Obtener todos los Especialistas con filtros
        /// </summary>
        /// <param name="Nombre">Nombre de Fantasia</param>
        /// <param name="Oficio">Oficio/Especialidad</param>
        /// <param name="Localidad">Ciudad/Departamento</param>
        /// <param name="CalificacionDesde">Calificacion desde</param>
        /// <param name="CalificacionHasta">Calificacion hasta</param>
        /// <param name="Page">Paginado</param>
        /// <param name="OrderBy">Criterio de Orden</param>
        /// <param name="OrderByMethod">True: Ascendente, False: Descendente</param>
        /// <returns></returns>
        [HttpGet("Filtrado")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<EspecialistaResourceListResponse>>> GetListFiltred(
            string? Nombre,
            string? Oficio,
            decimal? CalificacionDesde,
            decimal? CalificacionHasta,
            string? Localidad,
            int? Page,
            string? OrderBy,
            bool OrderByMethod = true
            )
        {
            var especialsitaCollection = await _especialistaService.GetListFiltred(
                new ListFilter
                {
                    Nombre = Nombre,
                    Oficio = Oficio,
                    Localidad = Localidad,
                    CalificacionDesde = CalificacionDesde,
                    CalificacionHasta = CalificacionHasta,
                    Page = Page,
                    OrderBy = OrderBy,
                    OrderByMethod = OrderByMethod
                });
            if (especialsitaCollection == null) return NotFound($"No se encontro ningun especialista");
            var especialistaResourcesListResponse = _mapper.Map<IEnumerable<Especialista>, IEnumerable<EspecialistaResourceListResponse>>(especialsitaCollection);
            return Ok(especialistaResourcesListResponse);
        }

        //[HttpGet("{id}")]
        //[ProducesResponseType(StatusCodes.Status201Created)]
        //[ProducesResponseType(StatusCodes.Status400BadRequest)]
        //[ProducesResponseType(StatusCodes.Status404NotFound)]
        //public async Task<ActionResult<UserResourceResponse>> GetById(string id)
        //{
        //    if (string.IsNullOrWhiteSpace(id)) return BadRequest($"El id no es valida");
        //    Usuario user = await _especialistaService.GetById(id);
        //    if (user == null) return NotFound($"No se encontro un usuario con la id {id}");
        //    UserResourceResponse response = _mapper.Map<Usuario, UserResourceResponse>(user);
        //    return Ok(response);
        //}

        //[HttpPost("Especialista")]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //[ProducesResponseType(StatusCodes.Status400BadRequest)]
        //[ProducesResponseType(StatusCodes.Status404NotFound)]
        //public async Task<ActionResult<ClientResourceResponse>> CreateEspecialista([FromBody] ClientRegisterRequest userRegisterRequest)
        //{
        //    var validator = new ClientRegisterRequestValidator();
        //    var validatorResult = await validator.ValidateAsync(userRegisterRequest);
        //    if (!validatorResult.IsValid)
        //        return BadRequest(validatorResult.Errors);

        //    var userToCreate = _mapper.Map<ClientRegisterRequest, Usuario>(userRegisterRequest);
        //    Usuario newUser = await _userservice.Create(userToCreate);
        //    Usuario user = await _userservice.GetById(newUser.Documento);
        //    ClientResourceResponse response = _mapper.Map<Usuario, ClientResourceResponse>(user);
        //    return Created("Created", response);
        //}
    }
}
