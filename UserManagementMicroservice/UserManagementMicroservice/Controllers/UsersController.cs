
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
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
        public ActionResult<List<User>> Get() => _repository.GetAll().ToList();

        [HttpGet("{id}", Name = "GetById")]
        public ActionResult<User> GetById(int id) => _repository.GetById(id);

        [Route("register")]
        [HttpPost]
        public IActionResult Register(string username, string email, string password)
        {
            int result = _repository.Register(username, email, password);
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
        public IActionResult Login(string email, string password)
        {
            if(_repository.Login(email, password))
            {
                return Ok();
            }
            return NotFound(new Error("Email or passowrd invalid"));
            
        }

        [HttpPut]
        public IActionResult Update(User user)
        {
            int result = _repository.Update(user);
            if(result == -1)
            {
                return NotFound(new Error("User doesn't exist"));
            }
            return NoContent();
        }
        [HttpDelete]
        public IActionResult Delete(string email)
        {
            int result = _repository.DeleteById(email);
            if(result == -1)
            {
                return NotFound(new Error("User doesn't exist"));
            }
            return NoContent();

        }
    }
}
