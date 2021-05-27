
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using System.Threading.Tasks;
using UserManagementMicroservice.Repositories;
using UserManagementMicroservice.DTOs;
using UserManagementMicroservice.Utils;

namespace UserManagementMicroservice.Controllers
{

    //admin user with id = 15 and JWT: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XL0
    //role-->0 pt guest, 1 pt admin, 2 pt staff
    [Route("api/v1/users")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUsersRepository _repository;

        [ActivatorUtilitiesConstructor]
        public UsersController(IUsersRepository repository)
        {
            _repository = repository;
        }
        public UsersController()
        {

        }
        [HttpGet]
        public async Task<IActionResult> GetAllAsync([FromHeader] string authorizationToken)
        {
            var result=CheckAuth(authorizationToken) as ObjectResult;
            var response = await _repository.GetAllAsync(Jwt.ExtractUserId(result.Value.ToString()));
            if (response == null)
            {
                return Unauthorized(new Error("Admin privileges required"));
            }
            return Ok(response);
        }

        [HttpGet("{id}", Name = "GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var result = await _repository.GetByIdAsync(id);
            if (result == null)
            {
                return NotFound(new Error($"User with id {id} does not exist"));
            }
            return Ok(result);
        }

        [Route("staff")]
        [HttpGet]
        public async Task<IActionResult> GetStaffMembersAsync([FromHeader] string authorizationToken)
        {
            var jsonObjectResult = CheckAuth(authorizationToken) as ObjectResult;
            if (jsonObjectResult is UnauthorizedObjectResult)
            {
                return jsonObjectResult;
            }
            var priviliges = await VerifyAdminPrivileges(jsonObjectResult.Value.ToString());
            if (priviliges is UnauthorizedObjectResult)
            {
                return priviliges;
            }
            var response = await _repository.GetStaffMembersAsync();
            if (response == null)
            {
                return NotFound(new Error("There are no staff members yet."));
            }
            return Ok(response);

        }

        [Route("name")]
        [HttpGet]
        public async Task<IActionResult> GetUserIdByNameAsync(string name)
        {
            var result = await _repository.GetUserIdByNameAsync(name);
            if(result == 0)
            {
                return NotFound(new Error($"User with name {name} does not exist."));
            }
            return Ok(result);
        }

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

        [Route("adminPrivileges")]
        [HttpGet]
        public async Task<IActionResult> VerifyAdminPrivileges(string json)
        {
            var result = await _repository.HasAdminPrivileges(Jwt.ExtractUserId(json));
            if (!result)
            {
                return Unauthorized(new Error("Admin privileges required"));
            }
            return Ok(result);
        }

        [Route("user")]
        [HttpGet]
        public async Task<IActionResult> GetByIdAsync([FromHeader] string authorizationToken)
        {
            var result = CheckAuth(authorizationToken) as ObjectResult;
            if(result is UnauthorizedObjectResult)
            {
                return result;
            }
            var response = await _repository.GetByIdAsync(Jwt.ExtractUserId(result.Value.ToString()));
            return Ok(response);
        }

        [Route("username")]
        [HttpGet]
        public async Task<IActionResult> GetUsernameAsync([FromHeader] string authorizationToken)
        {
            var result = CheckAuth(authorizationToken) as ObjectResult;
            if (result is UnauthorizedObjectResult)
            {
                return result;
            }
            var user = await _repository.GetByIdAsync(Jwt.ExtractUserId(result.Value.ToString()));
            if(user == null)
            {
                return NotFound(new Error("User doesnt't exist"));
            }
            return Ok(JsonConvert.SerializeObject(new { username = user.Username }));
        }

        [Route("register")]
        [HttpPost]
        public async Task<IActionResult> RegisterAsync(UserRegisterDto userRegister,int role)
        {
            var result = await _repository.RegisterAsync(userRegister, role);
            if (result == -2)
            {
                return Conflict(new Error("Email already exists"));
            }
            if (result == -1)
            {
                return Conflict(new Error("Username already exists"));
            }
            return Ok(result);
        }

        
        [Route("register/guest")]
        [HttpPost]
        public async Task<IActionResult> RegisterGuestAsync([FromBody] UserRegisterDto userRegister)
        {
            var result = await RegisterAsync(userRegister, 0);
            if (result is ConflictObjectResult)
            {
                return result;
            }
            MailSystem.SendRegistrationMail(userRegister.Email, userRegister.Username);
            return CreatedAtAction(nameof(GetById), new { id = result }, userRegister);
        }

        [Route("register/admin")]
        [HttpPost]
        public async Task<IActionResult> RegisterAdminAsync([FromHeader] string authorizationToken, [FromBody] UserRegisterDto userRegister)
        {
            var jsonObjectResult = CheckAuth(authorizationToken) as ObjectResult;
            if (jsonObjectResult is UnauthorizedObjectResult)
            {
                return jsonObjectResult;
            }
            var priviliges = await VerifyAdminPrivileges(jsonObjectResult.Value.ToString());
            if (priviliges is UnauthorizedObjectResult)
            {
                return priviliges;
            }
            var result = await RegisterAsync(userRegister, 1);
            if (result is ConflictObjectResult)
            {
                return result;
            }
            return CreatedAtAction(nameof(GetById), new { id = result }, userRegister);
        }

        [Route("register/staff")]
        [HttpPost]
        public async Task<IActionResult> RegisterStaffAsync([FromHeader] string authorizationToken, [FromBody] UserRegisterDto userRegister)
        {
            var jsonObjectResult = CheckAuth(authorizationToken) as ObjectResult;
            if (jsonObjectResult is UnauthorizedObjectResult)
            {
                return jsonObjectResult;
            }
            var priviliges = await VerifyAdminPrivileges(jsonObjectResult.Value.ToString());
            if (priviliges is UnauthorizedObjectResult)
            {
                return priviliges;
            }
            var result = await RegisterAsync(userRegister, 2);
            if (result is ConflictObjectResult)
            {
                return result;
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
        public async Task<IActionResult> UpdateAsync([FromBody] UserRegisterDto user,[FromHeader] string authorizationToken)
        {
            var result = CheckAuth(authorizationToken) as ObjectResult;
            if (result is UnauthorizedObjectResult)
            {
                return result;
            }
            bool isUpdated = await _repository.UpdateAsync(user, Jwt.ExtractUserId(result.Value.ToString()));
            if(!isUpdated)
            {
                return NotFound(new Error("User doesn't exist"));
            }
            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteAsync([FromHeader] string authorizationToken) 
        {
            var result = CheckAuth(authorizationToken) as ObjectResult;
            if (result is UnauthorizedObjectResult)
            {
                return result;
            }
            await _repository.DeleteByIdAsync(Jwt.ExtractUserId(result.Value.ToString()));
            return NoContent();
            
        } 

    }
}
