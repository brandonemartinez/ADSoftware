using Api.Resources.Client;
using Api.Resources.Especialist;
using AutoMapper;
using Core.Models;

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
            CreateMap<EspecialistRegisterRequest, Usuario>()
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ForPath(dest => dest.Especialista.RazonSocial, act => act.MapFrom(src => src.RazonSocial))
                .ForPath(dest => dest.Especialista.IdPlanes, act => act.MapFrom(src => src.IdPlanes))
                .ForPath(dest => dest.Especialista.Fotos, act => act.MapFrom(src => src.Fotos))
                .ReverseMap();
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






