using Api.Resources.Cita;
using Api.Resources.Client;
using Api.Resources.Department;
using Api.Resources.Especialist;
using Api.Resources.Oficio;
using Api.Resources.Plan;
using Api.Resources.Usuario;
using AutoMapper;
using Core.Models;
using Data.Dto.Especialista;
using Dtos.Dto;
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
            CreateMap<Usuario, EspecialistResourceResponse>().ReverseMap();
            CreateMap<Departamento, DepartmentResourceListResponse>()
                .ForMember(dest => dest.Departamento, act => act.MapFrom(src => src.Nombre))
                .ForMember(dest => dest.Ciudades, act => act.MapFrom(src => src.Ciudad))
                .ReverseMap();
            CreateMap<Ciudad, CiudadDto>()
                .ForMember(dest => dest.Nombre, act => act.MapFrom(src => src.Nombre))
                .ReverseMap();
            CreateMap<EspecialistRegisterRequest, Usuario>()
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.NombreFantasia, act => act.MapFrom(src => src.NombreFantasia))
                //.ForPath(dest => dest.Especialista.FotoPerfil, act => act.Ignore())
                //.ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.Presentacion, act => act.MapFrom(src => src.Presentacion))
                .ForPath(dest => dest.Especialista.RangoDia, act => act.MapFrom(src => src.RangoDia))
                .ForPath(dest => dest.Especialista.HoraDesde, act => act.MapFrom(src => src.HoraDesde))
                .ForPath(dest => dest.Especialista.HoraHasta, act => act.MapFrom(src => src.HoraHasta))
                .ForPath(dest => dest.Especialista.DepartamentoDisponible, act => act.MapFrom(src => src.DepartamentoDisponible))
                .ForPath(dest => dest.Especialista.IdPaquete, act => act.MapFrom(src => src.idPaquete))
                .ReverseMap();
            CreateMap<CreatedEspecialistRegisterRequest, Usuario>()
                .ForPath(dest => dest.Id, act => act.MapFrom(src => src.IdUsuario))
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.NombreFantasia, act => act.MapFrom(src => src.NombreFantasia))
                //.ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.Presentacion, act => act.MapFrom(src => src.Presentacion))
                .ForPath(dest => dest.Especialista.RangoDia, act => act.MapFrom(src => src.RangoDia))
                .ForPath(dest => dest.Especialista.HoraDesde, act => act.MapFrom(src => src.HoraDesde))
                .ForPath(dest => dest.Especialista.HoraHasta, act => act.MapFrom(src => src.HoraHasta))
                .ForPath(dest => dest.Especialista.DepartamentoDisponible, act => act.MapFrom(src => src.DepartamentoDisponible))
                .ForPath(dest => dest.Especialista.IdPaquete, act => act.MapFrom(src => src.idPaquete))
                .ReverseMap();
            CreateMap<EspecialistUpdateRequest, Usuario>()
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.NombreFantasia, act => act.MapFrom(src => src.NombreFantasia))
                //.ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                //.ForPath(dest => dest.Especialista.FotoPerfil, act => act.MapFrom(src => src.FotoPerfil))
                .ForPath(dest => dest.Especialista.Presentacion, act => act.MapFrom(src => src.Presentacion))
                .ForPath(dest => dest.Especialista.RangoDia, act => act.MapFrom(src => src.RangoDia))
                .ForPath(dest => dest.Especialista.HoraDesde, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraDesde)))
                .ForPath(dest => dest.Especialista.HoraHasta, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraHasta)))
                .ForPath(dest => dest.Especialista.DepartamentoDisponible, act => act.MapFrom(src => src.DepartamentoDisponible))
                .ForPath(dest => dest.Especialista.IdPaquete, act => act.MapFrom(src => src.IdPaquete))
                .ReverseMap();
            CreateMap<EspecialistaResourceListResponse, Especialista>()
                .ForPath(dest => dest.NombreFantasia, act => act.MapFrom(src => src.Nombre))
                .ReverseMap();
            CreateMap<CitaResourceCreateRequest, Cita>()
                .ForPath(dest => dest.HoraHasta, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraHasta)))
                .ForPath(dest => dest.HoraDesde, act => act.MapFrom(src => TimeSpan.FromHours(src.HoraDesde)))
                .ReverseMap();
            CreateMap<Cita, CitaDto>().ReverseMap();
            CreateMap<Oficio, OficioDto>().ReverseMap();
            CreateMap<Oficio, OficioResourceCreateRequest>().ReverseMap();
            CreateMap<Paquete, PlanResourceCreateRequest>().ReverseMap();
            CreateMap<Paquete, PlanListResourceResponse>().ReverseMap();
            CreateMap<Paquete, PlanDto>().ReverseMap();
            CreateMap<Usuario, ClientUpdateRequest>().ReverseMap();
            CreateMap<Usuario, ClientResourceResponse>().ReverseMap();
            CreateMap<Especialista, EspecialistaDto>()
                //.ForPath(dest => dest.FotoPerfil, act => act.MapFrom(src => src.FotoPerfil))
                .ReverseMap();
        }
    }
}






