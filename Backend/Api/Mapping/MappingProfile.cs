using Api.Resources.Client;
using Api.Resources.Department;
using Api.Resources.Especialist;
using AutoMapper;
using Core.Models;
using Dtos.Dto.Departamento;

namespace Api.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //Usuario
            CreateMap<Usuario, ClientResourceResponse>().ReverseMap();
            CreateMap<Usuario, EspecialistResourceResponse>().ReverseMap();
            CreateMap<Departamento, DepartmentResourceListResponse>()
                .ForMember(dest => dest.Departamento, act => act.MapFrom(src => src.Nombre))
                .ForMember(dest => dest.Ciudades, act => act.MapFrom(src => src.Ciudad))
                .ReverseMap();
            CreateMap<Ciudad, CiudadDto>()
                .ForMember(dest => dest.Nombre, act => act.MapFrom(src => src.Nombre))
                .ReverseMap();
            CreateMap<EspecialistRegisterRequest, Usuario>()
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.IdPaquete, act => act.MapFrom(src => src.IdPlanes))
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ReverseMap();
            CreateMap<EspecialistUpdateRequest, Usuario>()
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.IdPaquete, act => act.MapFrom(src => src.IdPlanes))
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.Calificacion, act => act.MapFrom(src => src.Calificacion))
                .ReverseMap();
            CreateMap<ClientResourceResponse, Usuario>().ReverseMap();
            CreateMap<EspecialistaResourceListResponse, Especialista>()
                .ForPath(dest => dest.IdNavigation.Nombre, act => act.MapFrom(src => src.Nombre))
                .ReverseMap();
        }
    }
}






