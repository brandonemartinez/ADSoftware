using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userservice;
        private readonly IMapper _mapper;

        public UserController(IUserService userservice, IMapper mapper)
        {
            _userservice = userservice;
            _mapper = mapper;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<UserResourceResponse>>> GetAll()
        {
            var userCollection = await _userservice.GetAll();
            var userResourcesResponse = _mapper.Map<IEnumerable<User>, IEnumerable<UserResourceResponse>>(userCollection);
            return Ok(userResourcesResponse);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<UserResourceResponse>> GetById(string id)
        {
            var user = await _userservice.GetById(id);
            var userResourcesResponse = _mapper.Map<User, UserResourceResponse>(user);
            return Ok(userResourcesResponse);
        }

    }
}
