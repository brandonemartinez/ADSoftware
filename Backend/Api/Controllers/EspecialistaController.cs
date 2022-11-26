using Api.Mapping;
using Api.Resources.Especialist;
using Api.Validators;
using AutoMapper;
using Core.Models;
using Core.Services;
using Data.Dto.Especialista;
using Dtos.Dto.Especialista;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize(Roles = "Administrador")]
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
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(IEnumerable<EspecialistaResourceListResponse>))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        public async Task<ActionResult<IEnumerable<EspecialistaResourceListResponse>>> GetAll()
        {
            var especialsitaCollection = await _especialistaService.GetAll();
            if (especialsitaCollection == null) return NotFound($"No se encontro ningun especialista");
            var especialistaResourcesListResponse = _mapper.Map<IEnumerable<Especialista>, IEnumerable<EspecialistaResourceListResponse>>(especialsitaCollection);
            return Ok(especialistaResourcesListResponse);
        }

        /// <summary>
        /// Obtener Especialista por Id
        /// </summary>
        /// <param name="idEspecialista"></param>
        /// <returns></returns>
        [HttpGet("{idEspecialista}")]
        [ProducesResponseType(StatusCodes.Status200OK,Type = typeof(EspecialistaDto))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        public async Task<ActionResult<EspecialistaDto>> Get(int idEspecialista)
        {
            Especialista especialista = await _especialistaService.GetById(idEspecialista);

            if (especialista == null) return NotFound($"No se encontro ningun especialista");

            var especialistaResponse = _mapper.Map<Especialista, EspecialistaDto>(especialista);
            return Ok(especialistaResponse);
        }
        /// <summary>
        /// Obtener todos los Especialistas con filtros
        /// </summary>
        /// <param name="Busqueda">Nombre/Oficio</param>
        /// <param name="Localidad">Ciudad/Departamento</param>
        /// <param name="Calificacion">Calificacion igual</param>
        /// <param name="CalificacionDesde">Calificacion desde</param>
        /// <param name="CalificacionHasta">Calificacion hasta</param>
        /// <param name="OrderBy">Criterio de Orden</param>
        /// <param name="OrderByMethod">True: Ascendente, False: Descendente</param>
        /// <returns></returns>
        [HttpGet("Filtrado")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(IEnumerable<EspecialistaResourceListResponse>))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        public async Task<ActionResult<IEnumerable<EspecialistaResourceListResponse>>> GetListFiltred(
            string? Busqueda,
            decimal? Calificacion,
            decimal? CalificacionDesde,
            decimal? CalificacionHasta,
            string Localidad,
            string? OrderBy,
            bool OrderByMethod = true
            )
        {
            var especialsitaCollection = await _especialistaService.GetListFiltred(
                new ListFilter
                {
                    Busqueda = Busqueda,
                    Localidad = Localidad,
                    Calificacion = Calificacion,
                    CalificacionDesde = CalificacionDesde,
                    CalificacionHasta = CalificacionHasta,
                    OrderBy = OrderBy,
                    OrderByMethod = OrderByMethod
                });
            if (especialsitaCollection == null) return NotFound($"No se encontro ningun especialista");
            IEnumerable<EspecialistaResourceListResponse> especialistaResourcesListResponse = _mapper.Map<IEnumerable<Especialista>, IEnumerable<EspecialistaResourceListResponse>>(especialsitaCollection);
            return Ok(especialistaResourcesListResponse);
        }

    }
}
