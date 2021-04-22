
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.ComponentModel;
using System.Threading.Tasks;
using UserManagementMicroservice.Data;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;

namespace UserManagementMicroservice.Controllers
{

    //admin user with id = 2 and JWT: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTkyOTYyNDMsInVzZXJJZCI6Mn0.iDhjcbhbd0V-BxJjgr6rxRd9mhrQBz2XZH2kOK3ohJU
    //role-->0 pt guest, 1 pt admin, 2 pt staff
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
        public async Task<IActionResult> GetAllAsync([FromHeader] string authorizationToken)
        {
            var result = Jwt.CheckJWT(authorizationToken);
            if (!Jwt.IsValidJWT(result))
            {
                return Unauthorized(new Error(result));
            }
            var response = await _repository.GetAllAsync(Jwt.ExtractUserId(result));
            if(response==null)
            {
                return Unauthorized(new Error("You are not an admin."));
            }
            return Ok(response);
        }

        [Route("authorization")]
        [HttpGet]

        public  IActionResult CheckAuth([FromHeader] string authorizationToken)
        {
            var result =Jwt.CheckJWT(authorizationToken);
            if (!Jwt.IsValidJWT(result))
            {
                return Unauthorized(new Error(result));
            }
            return Ok(result);
        }

        [Route("user")]
        [HttpGet]
        public async Task<IActionResult> GetAsync([FromHeader] string authorizationToken)
        {
            var result = Jwt.CheckJWT(authorizationToken);
            if (!Jwt.IsValidJWT(result))
            {
                return Unauthorized(new Error(result));
            }
            var response = await _repository.GetByIdAsync(Jwt.ExtractUserId(result));
            return Ok(response);
        }

        [Route("username")]
        [HttpGet]
        public async Task<IActionResult> GetUsernameAsync([FromHeader] string authorizationToken)
        {
            var result = Jwt.CheckJWT(authorizationToken);
            if(!Jwt.IsValidJWT(result))
            {
                return Unauthorized(new Error(result));
            }
            var user = await _repository.GetByIdAsync(Jwt.ExtractUserId(result));
            if(user == null)
            {
                return NotFound(new Error("User doesnt't exist"));
            }
            return Ok(JsonConvert.SerializeObject(new { username = user.Username }));
        }

        [Route("register")]
        [HttpPost]
        public async Task<IActionResult> RegisterAsync([FromBody] UserRegister userRegister)
        {
            var result = await _repository.RegisterAsync(userRegister);
            if(result == -2)    
            {
                return Conflict(new Error("Email already exists"));
            }
            if(result == -1)   
            {
                return Conflict(new Error("Username already exists"));
            }
            return CreatedAtAction("register", userRegister);
        }

        [Route("login")]
        [HttpPost]
        public async Task<IActionResult> LoginAsync([FromBody] UserCredentials userCredentials)
        {
            var userId = await _repository.LoginAsync(userCredentials);
            if (userId == -1)
            {
                return BadRequest(new Error("Email or password invalid"));
            }
            return Ok(JsonConvert.SerializeObject(new { jwt = Jwt.CreateJWT(userId, 1) }));
            
            
        }

        [HttpPut]
        public async Task<IActionResult> UpdateAsync([FromBody] UserRegister user,[FromHeader] string authenticationToken)
        {
            var result = Jwt.CheckJWT(authenticationToken);
            if (!Jwt.IsValidJWT(result))
            {
                return Unauthorized(new Error(result));
            }
            bool isUpdated = await _repository.UpdateAsync(user, Jwt.ExtractUserId(result));
            if(!isUpdated)
            {
                return NotFound(new Error("User doesn't exist"));
            }
            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteAsync([FromHeader] string authenticationToken) 
        {
            var result = Jwt.CheckJWT(authenticationToken);
            if (!Jwt.IsValidJWT(result))
            {
                return Unauthorized(new Error(result));
            }
            await _repository.DeleteByIdAsync(Jwt.ExtractUserId(result));
            return NoContent();
            
        } 
    }
}
