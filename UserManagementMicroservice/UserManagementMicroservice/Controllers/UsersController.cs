
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using UserManagementMicroservice.Data;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;

namespace UserManagementMicroservice.Controllers
{
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
        public async Task<IActionResult> RegisterAsync(string username, string email, string password)
        {
            var result = await _repository.RegisterAsync(username, email, password);
            if(result == -2)    
            {
                return Conflict(new Error("Email already exists"));
            }
            if(result == -1)   
            {
                return Conflict(new Error("Username already exists"));
            }
            return Ok();
        }

        [Route("login")]
        [HttpPost]
        public async Task<IActionResult> LoginAsync(string email, string password)
        {
            if(await _repository.LoginAsync(email, password))
            {
                return Ok();
            }
            return NotFound(new Error("Email or passowrd invalid"));
            
        }

        [HttpPut]
        public async Task<IActionResult> UpdateAsync(User user)
        {
            bool isUpdated = await _repository.UpdateAsync(user);
            if(!isUpdated)
            {
                return NotFound(new Error("User doesn't exist"));
            }
            return NoContent();
        }
        [HttpDelete]
        public async Task DeleteAsync(int id) => await _repository.DeleteByIdAsync(id);
        /*{
            bool isDeleted = await _repository.DeleteByEmailAsync(id);
            if(!isDeleted)
            {
                return NotFound(new Error("User doesn't exist"));
            }
            return NoContent();

        }*/
    }
}
