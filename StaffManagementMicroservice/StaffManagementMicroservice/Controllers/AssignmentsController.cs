﻿using Microsoft.AspNetCore.Mvc;
using StaffManagementMicroservice.Data;
using StaffManagementMicroservice.DTOs;
using StaffManagementMicroservice.Utils;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace StaffManagementMicroservice.Controllers
{

    [Route("api/v1/assignments")]
    [ApiController]
    public class AssignmentsController : ControllerBase
    {
        private readonly IAssignmentsRepository _repository;
        private readonly HttpClient client;
        private readonly string usersManagementMicroserviceUri = "http://localhost:60094/api/v1/users/";

        public AssignmentsController(IAssignmentsRepository repository)
        {
            _repository = repository;
            client = new HttpClient();
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
        [Route("verify")]
        [HttpGet]
        public async Task<IActionResult> VerifyAuthorization(string authorizationToken)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + "authorization");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            return Ok(responseAuthorization.Content.ReadAsStringAsync().Result);
        }

        [Route("own")]
        [HttpGet]
        public async Task<IActionResult> GetAssignmentByUserIdAsync([FromHeader] string authorizationToken)
        {
            var verify = await VerifyAuthorization(authorizationToken);
            if (verify is UnauthorizedObjectResult)
            {
                return verify;
            }

            var userId = Extract.ExtractUserId((verify as ObjectResult).Value.ToString());
            var result = await _repository.GetAssignmentByUserIdAsync(userId);
            if (result == null)
            {
                return NotFound(new Error($"User with this {userId} does not have any assignments yet."));
            }
            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> PostAssignmentAsync([FromHeader] string authorizationToken, [FromBody] PostAssignmentDto postAssignmentDto)
        {
            client.DefaultRequestHeaders.Add("authorizationToken", authorizationToken);
            var responseAuthorization = await client.GetAsync(usersManagementMicroserviceUri + $"name?name={postAssignmentDto.Name}");
            if (responseAuthorization.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                return Unauthorized(responseAuthorization.Content.ReadAsStringAsync().Result);
            }
            int userId = Int32.Parse(responseAuthorization.Content.ReadAsStringAsync().Result);
            await _repository.PostAssignmentAsync(postAssignmentDto, userId);
            return Ok(postAssignmentDto);
        }

        [HttpPut]
        public async Task<IActionResult> UpdateAsync([FromBody] int status, int id)
        {
            bool isUpdated = await _repository.UpdateAsync(status, id);
            if (!isUpdated)
            {
                return NotFound(new Error("Assignment doesn't exist"));
            }
            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteAsync(int id)
        {
            await _repository.DeleteByIdAsync(id);
            return NoContent();
        }
    }
}
