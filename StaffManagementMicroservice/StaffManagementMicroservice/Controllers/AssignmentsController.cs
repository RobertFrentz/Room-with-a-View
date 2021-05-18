using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StaffManagementMicroservice.Data;
using StaffManagementMicroservice.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.Controllers
{

    [Route("api/v1/assignments")]
    [ApiController]
    public class AssignmentsController : ControllerBase
    {
        private readonly IAssignmentsRepository _repository;

        public AssignmentsController(IAssignmentsRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public async Task<IActionResult> GetAssignmentsAsync()
        {
            var result = await _repository.GetAssignmentsAsync();
            return Ok(result);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetAssignmentAsync(int id)
        {
            var result = await _repository.GetAssignmentAsync(id);
            if(result == null)
            {
                return NotFound(new Error($"Assignment with id {id} does not exist"));
            }
            return Ok(result);
        }
    }
}
