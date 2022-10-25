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
            CreateMap<Usuario, ClientRegisterRequest>().ReverseMap();
            CreateMap<Usuario, EspecialistResourceResponse>().ReverseMap();
            CreateMap<Departamento, DepartmentResourceListResponse>()
                .ForMember(dest => dest.Departamento, act => act.MapFrom(src => src.Nombre))
                .ForMember(dest => dest.Ciudades, act => act.MapFrom(src => src.Ciudads))
                .ReverseMap();
            CreateMap<Ciudad, CiudadDto>()
                .ForMember(dest => dest.Ciudad, act => act.MapFrom(src => src.Ciudad1))
                .ReverseMap();
            CreateMap<EspecialistRegisterRequest, Usuario>()
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.IdPlanes, act => act.MapFrom(src => src.IdPlanes))
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ReverseMap();
            CreateMap<EspecialistUpdateRequest, Usuario>()
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.IdPlanes, act => act.MapFrom(src => src.IdPlanes))
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.Documento, act => act.MapFrom(src => src.Documento))
                .ForPath(dest => dest.Especialista.Calificacion, act => act.MapFrom(src => src.Calificacion))
                .ReverseMap();
            CreateMap<ClientResourceResponse, Usuario>().ReverseMap();
            CreateMap<EspecialistaResourceListResponse, Especialista>()
                .ForPath(dest => dest.DocumentoNavigation.Nombre, act => act.MapFrom(src => src.Nombre))
                .ForPath(dest => dest.DocumentoNavigation.Apellido, act => act.MapFrom(src => src.Apellido))
                .ForPath(dest => dest.DocumentoNavigation.Correo, act => act.MapFrom(src => src.Correo))
                .ForPath(dest => dest.DocumentoNavigation.Telefono, act => act.MapFrom(src => src.Telefono))
                .ForPath(dest => dest.DocumentoNavigation.IdDepartamento, act => act.MapFrom(src => src.IdDepartamento))
                .ReverseMap();
        }
    }
}






