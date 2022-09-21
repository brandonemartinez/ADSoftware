using Api.Resources.Client;
using Api.Resources.Especialist;
using AutoMapper;
using Data.Models;

namespace Api.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //Usuario
            CreateMap<Usuario, ClientResourceResponse>().ReverseMap();
            CreateMap<Usuario, ClientRegisterRequest>().ReverseMap();
            CreateMap<EspecialistRegisterRequest, Usuario>()
                .ForMember(dest => dest.Especialista.Documento, act => act.MapFrom(src => src.Documento)).ReverseMap();
        }
    }
}
