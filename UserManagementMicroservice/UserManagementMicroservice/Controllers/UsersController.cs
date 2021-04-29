
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.ComponentModel;
using System.Threading.Tasks;
using UserManagementMicroservice.Data;
using UserManagementMicroservice.DTOs;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;

namespace UserManagementMicroservice.Controllers
{

    //admin user with id = 14 and JWT: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyMzU1ODAsInVzZXJJZCI6MTR9.FAhpM6vMEfGN8MdfXyuvt1FV7iTboF4X4S8jRdGg7Bs
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
            if (response == null)
            {
                return Unauthorized(new Error("Admin privileges required"));
            }
            return Ok(response);
        }

        [HttpGet("{id}", Name = "GetById")]
        public async Task<User> GetById(int id) => await _repository.GetByIdAsync(id);

        [Route("authorization")]
        [HttpGet]

        public IActionResult CheckAuth([FromHeader] string authorizationToken)
        {
            var result = Jwt.CheckJWT(authorizationToken);
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

        [Route("register/guest")]
        [HttpPost]
        public async Task<IActionResult> RegisterGuestAsync([FromBody] UserRegisterDto userRegister)
        {
            var result = await _repository.RegisterAsync(userRegister, 0);
            if(result == -2)    
            {
                return Conflict(new Error("Email already exists"));
            }
            if(result == -1)   
            {
                return Conflict(new Error("Username already exists"));
            }
            return CreatedAtAction(nameof(GetById), new { id = result }, userRegister);
        }

        [Route("register/admin")]
        [HttpPost]
        public async Task<IActionResult> RegisterAdminAsync([FromHeader] string authorizationToken, [FromBody] UserRegisterDto userRegister)
        {
            var jwt = Jwt.CheckJWT(authorizationToken);
            if (!Jwt.IsValidJWT(jwt))
            {
                return Unauthorized(new Error(jwt));
            }
            if (! await _repository.HasAdminPrivileges(Jwt.ExtractUserId(jwt)))
            {
                return Unauthorized(new Error("Admin privileges required"));
            }
            var result = await _repository.RegisterAsync(userRegister, 1);
            if (result == -2)
            {
                return Conflict(new Error("Email already exists"));
            }
            if (result == -1)
            {
                return Conflict(new Error("Username already exists"));
            }
            return CreatedAtAction(nameof(GetById), new { id = result }, userRegister);
        }

        [Route("register/staff")]
        [HttpPost]
        public async Task<IActionResult> RegisterStaffAsync([FromHeader] string authorizationToken, [FromBody] UserRegisterDto userRegister)
        {
            var jwt = Jwt.CheckJWT(authorizationToken);
            if (!Jwt.IsValidJWT(jwt))
            {
                return Unauthorized(new Error(jwt));
            }
            if (!await _repository.HasAdminPrivileges(Jwt.ExtractUserId(jwt)))
            {
                return Unauthorized(new Error("Admin privileges required"));
            }
            var result = await _repository.RegisterAsync(userRegister, 2);
            if (result == -2)
            {
                return Conflict(new Error("Email already exists"));
            }
            if (result == -1)
            {
                return Conflict(new Error("Username already exists"));
            }
            return CreatedAtAction(nameof(GetById), new { id = result }, userRegister);
        }

        [Route("login")]
        [HttpPost]
        public async Task<IActionResult> LoginAsync([FromBody] UserCredentialsDto userCredentials)
        {
            var user = await _repository.LoginAsync(userCredentials);
            if (user == null)
            {
                return BadRequest(new Error("Email or password invalid"));
            }
            string userRole = ((Role)user.Role).ToString();
            return Ok(JsonConvert.SerializeObject(new { jwt = Jwt.CreateJWT(user.Id, 1), role = userRole }));
            
            
        }

        [HttpPut]
        public async Task<IActionResult> UpdateAsync([FromBody] UserRegisterDto user,[FromHeader] string authenticationToken)
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
