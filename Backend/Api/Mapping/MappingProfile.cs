using Api.Resources.Cita;
using Api.Resources.Client;
using Api.Resources.Department;
using Api.Resources.Especialist;
using Api.Resources.Oficio;
using Api.Resources.Plan;
using Api.Resources.Reporte;
using Api.Resources.Usuario;
using AutoMapper;
using Core.Models;
using Data.Dto.Especialista;
using Dtos.Dto;
using Dtos.Dto.Archivo;
using Dtos.Dto.Cita;
using Dtos.Dto.Departamento;
using Dtos.Dto.Plan;
using System.Text;

namespace Api.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //Usuario
            CreateMap<UsuarioRegisterResponse, Usuario>().ReverseMap();
            CreateMap<UsuarioRegisterRequest, Usuario>().ReverseMap();
            CreateMap<ServiciosContratadosResponse, Cita>().ReverseMap();
            CreateMap<UsuarioDto, Usuario>().ReverseMap();
            CreateMap<EspecialistaDto, Usuario>()
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.Rut, act => act.MapFrom(src => src.Rut))
                .ForPath(dest => dest.Especialista.NombreFantasia, act => act.MapFrom(src => src.NombreFantasia))
                .ForPath(dest => dest.Especialista.Presentacion, act => act.MapFrom(src => src.Presentacion))
                .ForPath(dest => dest.Especialista.RangoDia, act => act.MapFrom(src => src.RangoDia))
                .ForPath(dest => dest.Especialista.HoraDesde, act => act.MapFrom(src => src.HoraDesde))
                .ForPath(dest => dest.Especialista.HoraHasta, act => act.MapFrom(src => src.HoraHasta))
                .ForPath(dest => dest.Especialista.DepartamentoDisponible, act => act.MapFrom(src => src.DepartamentoDisponible))
                .ForPath(dest => dest.Especialista.IdOficios, act => act.MapFrom(src => src.Oficios))
                .ForPath(dest => dest.Especialista.Archivos, act => act.MapFrom(src => src.Archivos))
                .ReverseMap();
            CreateMap<Usuario, EspecialistResourceResponse>().ReverseMap();
            CreateMap<Departamento, DepartmentResourceListResponse>()
                .ForMember(dest => dest.Departamento, act => act.MapFrom(src => src.Nombre))
                .ForMember(dest => dest.Ciudades, act => act.MapFrom(src => src.Ciudades))
                .ReverseMap();
            CreateMap<Ciudad, CiudadDto>()
                .ForMember(dest => dest.Nombre, act => act.MapFrom(src => src.Nombre))
                .ReverseMap();
            CreateMap<EspecialistRegisterRequest, Usuario>()
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.Rut, act => act.MapFrom(src => src.Rut))
                .ForPath(dest => dest.Especialista.NombreFantasia, act => act.MapFrom(src => src.NombreFantasia))
                .ForPath(dest => dest.Especialista.Presentacion, act => act.MapFrom(src => src.Presentacion))
                .ForPath(dest => dest.Especialista.RangoDia, act => act.MapFrom(src => src.RangoDia))
                .ForPath(dest => dest.Especialista.HoraDesde, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraDesde)))
                .ForPath(dest => dest.Especialista.HoraHasta, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraHasta)))
                .ForPath(dest => dest.Especialista.DepartamentoDisponible, act => act.MapFrom(src => src.DepartamentoDisponible))
                .ForPath(dest => dest.Especialista.IdPaquete, act => act.MapFrom(src => src.idPaquete))
                .ForPath(dest => dest.Especialista.IdOficios, act => act.MapFrom(src => src.Oficios))
                .ReverseMap();
            CreateMap<CreatedEspecialistRegisterRequest, Usuario>()
                .ForPath(dest => dest.Id, act => act.MapFrom(src => src.IdUsuario))
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.NombreFantasia, act => act.MapFrom(src => src.NombreFantasia))
                .ForPath(dest => dest.Especialista.Presentacion, act => act.MapFrom(src => src.Presentacion))
                .ForPath(dest => dest.Especialista.RangoDia, act => act.MapFrom(src => src.RangoDia))
                .ForPath(dest => dest.Especialista.HoraDesde, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraDesde)))
                .ForPath(dest => dest.Especialista.HoraHasta, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraHasta)))
                .ForPath(dest => dest.Especialista.DepartamentoDisponible, act => act.MapFrom(src => src.DepartamentoDisponible))
                .ForPath(dest => dest.Especialista.IdPaquete, act => act.MapFrom(src => src.idPaquete))
                .ReverseMap();
            CreateMap<EspecialistUpdateRequest, Usuario>()
                .ForPath(dest => dest.Id, act => act.MapFrom(src => src.Id))
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.NombreFantasia, act => act.MapFrom(src => src.NombreFantasia))
                .ForPath(dest => dest.Especialista.Presentacion, act => act.MapFrom(src => src.Presentacion))
                .ForPath(dest => dest.Especialista.RangoDia, act => act.MapFrom(src => src.RangoDia))
                .ForPath(dest => dest.Especialista.HoraDesde, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraDesde)))
                .ForPath(dest => dest.Especialista.HoraHasta, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraHasta)))
                .ForPath(dest => dest.Especialista.DepartamentoDisponible, act => act.MapFrom(src => src.DepartamentoDisponible))
                .ForPath(dest => dest.Especialista.IdPaquete, act => act.MapFrom(src => src.IdPaquete))
                .ReverseMap();

            CreateMap<OficioEspecialistaDto, Oficio>().ReverseMap();
            CreateMap<EspecialistaResourceListResponse, Especialista>()
                .ForMember(dest => dest.IdOficios, act => act.MapFrom(src => src.Oficios))
                .ReverseMap();
            CreateMap<CitaResourceCreateRequest, Cita>()
                .ForPath(dest => dest.HoraHasta, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraHasta)))
                .ForPath(dest => dest.HoraDesde, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraDesde)))
                .ReverseMap();
            CreateMap<Cita, CitaDto>().ReverseMap();
            CreateMap<Oficio, OficioResourceCreateRequest>().ReverseMap();
            CreateMap<Paquete, PlanResourceCreateRequest>().ReverseMap();
            CreateMap<Paquete, PlanListResourceResponse>().ReverseMap();
            CreateMap<Paquete, PlanDto>().ReverseMap();
            CreateMap<Usuario, ClientUpdateRequest>().ReverseMap();
            CreateMap<Usuario, ClientResourceResponse>().ReverseMap();
            CreateMap<Especialista, EspecialistaDto>()
                .ForMember(dest => dest.Oficios, act => act.MapFrom(src => src.IdOficios))
                .ReverseMap();
            CreateMap<Oficio, OficioDetalleDto>().ReverseMap();
            CreateMap<Archivo, ArchivoDto>().ReverseMap();
        }
    }
}






