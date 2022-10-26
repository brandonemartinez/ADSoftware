using Api.Mapping;
using Api.Resources.Especialist;
using Api.Validators;
using AutoMapper;
using Core.Models;
using Core.Services;
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
        [ProducesResponseType(StatusCodes.Status404NotFound)]
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
            IEnumerable<EspecialistaResourceListResponse> especialistaResourcesListResponse = _mapper.Map<IEnumerable<Especialista>, IEnumerable<EspecialistaResourceListResponse>>(especialsitaCollection);
            foreach (var item in especialistaResourcesListResponse)
            {
                var especialista = especialsitaCollection.FirstOrDefault(f => f.DocumentoNavigation.Nombre == item.Nombre);
                item.Oficios = new List<EspecialistaOficioListResponse>();
                foreach (var oficioEspecialista in especialista.OficioEspecialista)
                {
                    item.Oficios.Add(new EspecialistaOficioListResponse { Nombre = oficioEspecialista.IdOficioNavigation.Nombre });
                }

            };
            return Ok(especialistaResourcesListResponse);
        }

        [HttpPost("Disponibilidad")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<bool>> CreateEspecialista([FromBody] EspecialistaDisponibilidadRequest disponibilidadRequest)
        {
            var validator = new AgregarDisponibilidadValidator();
            foreach (var disponibilidad in disponibilidadRequest.Disponibilidad)
            {
                var validatorResult = await validator.ValidateAsync(disponibilidad);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);
            }

            IEnumerable<Disponibilidad> disponibilidadCollection = DisponibilidadMapper.MapDisponibilidad(disponibilidadRequest);
            bool result = await _especialistaService.AgregarDisponibilidad(disponibilidadRequest.IdDocumento, disponibilidadCollection);

            return Ok("Created");
        }
    }
}
