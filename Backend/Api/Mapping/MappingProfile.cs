using Api.Resources;
using AutoMapper;
using Data.Models;

namespace Api.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //Usuario
            CreateMap<Usuario, UserResourceResponse>().ReverseMap();
            CreateMap<Usuario, UserRegisterRequest>().ReverseMap();
        }
    }
}
