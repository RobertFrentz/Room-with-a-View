
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using UserManagementMicroservice.Data;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;

namespace UserManagementMicroservice.Controllers
{

    //test purpose eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjU3NzEzMTUsInVzZXJJZCI6MTZ9.RTfIz_1iMCIXswwXVaw9lCV8Y-hfk_gGsaDMGyENXrs

    [Route("api/v1/users")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUsersRepository _repository;

        public UsersController(IUsersRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public async Task<IEnumerable<User>> GetAsync()
        {
            return await _repository.GetAllAsync();
        }

        [HttpGet("{id}", Name = "GetById")]
        public async Task<User> GetByIdAsync(int id) => await _repository.GetByIdAsync(id);

        [Route("register")]
        [HttpPost]
        public async Task<IActionResult> RegisterAsync([FromBody] UserRegister userRegister)
        {
            var result = await _repository.RegisterAsync(userRegister);
            if(result==-2)    
            {
                return Conflict(new Error("Email already exists"));
            }
            if(result==-1)   
            {
                return Conflict(new Error("Username already exists"));
            }
            return Ok();
        }

        [Route("login")]
        [HttpPost]
        public async Task<IActionResult> LoginAsync([FromBody] UserCredentials userCredentials)
        {
            var result = await _repository.LoginAsync(userCredentials);
            if (!result.Equals("false"))
            {
                return Ok(result);
            }
            return NotFound(new Error("Email or password invalid"));
            
        }

        [HttpPut]
        public async Task<IActionResult> UpdateAsync([FromBody] User user,[FromHeader] string authentification_Token)
        {
            bool isUpdated = await _repository.UpdateAsync(user, authentification_Token);
            if(!isUpdated)
            {
                return NotFound(new Error("User doesn't exist"));
            }
            return NoContent();
        }
        [HttpDelete]
        public async Task DeleteAsync(int id) => await _repository.DeleteByIdAsync(id);
    }
}
