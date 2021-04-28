using Microsoft.EntityFrameworkCore;
using UserManagementMicroservice.Data;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Xunit;
using UserManagementMicroservice.Controllers;
using Assert = Xunit.Assert;
using System.Linq;
using System.Collections.Generic;
using UserManagementMicroservice.DTOs;

namespace UserManagementTests
{
    public class UserControllerUnitTest
    {
        readonly string AdminJWT = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjU3NzEzMTUsInVzZXJJZCI6MTZ9.RTfIz_1iMCIXswwXVaw9lCV8Y-hfk_gGsaDMGyENXrs";
        private User GetTestUser(int i)
        {
            if (i == 1)
            {
                return new User()
                {
                    Id = 1,
                    Username = "Test One",
                    Password = Cryptography.HashString("123"),
                    Email = Cryptography.HashString("has@gmail.com"),
                    Role = 1
                };
            }
            else
            {
                return new User()
                {
                    Id = 2,
                    Username = "Test Two",
                    Password = Cryptography.HashString("123"),
                    Email = Cryptography.HashString("mist@gmail.com"),
                    Role=1
                };
            }
        }
        [Fact]
        public async Task GetAllExistingUsers_ReturnAIEnurambleOfRegisteredUsersAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUsersDataBase")
                              .Options;
            var context = new DataContext(options);
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new UsersController(new UsersRepository(context));

            var result = await usersController.GetAllAsync(jwt) as OkObjectResult;
            var users = result.Value as IEnumerable<User>;
            Assert.Equal(GetTestUser(1).Id, users.ElementAt(0).Id);
            Assert.Equal(GetTestUser(2).Id, users.ElementAt(1).Id);
        }

        [Fact]
        public async Task GetExistingUserById_ReturnASpecifiedUserByIdAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUserSpecifiedDataBase")
                              .Options;
            var context = new DataContext(options);
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.SaveChanges();

            UsersController usersController = new UsersController(new UsersRepository(context));

            var result = await usersController.GetAsync(jwt) as OkObjectResult;
            var user1 = result.Value as User;

            Assert.Equal(GetTestUser(1).Id,user1.Id);
        }


        [Fact]
        public async Task UpdatingExistingUser_ReturnNoContentResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PutUserSpecifiedDataBase")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new UsersController(new UsersRepository(context));
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.SaveChanges();
            UserRegisterDto user1 = new() { Username = "Dorel", Password = "123", Email = "has@gmail.com" };
            var requestForUser1 = await usersController.UpdateAsync(user1, jwt);
            Assert.IsType<NoContentResult>(requestForUser1);

        }

        [Fact]
        public async Task DeleteExistingUser_GetThatUserById_ReturnNullAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "DeleteUsersDataBase")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new UsersController(new UsersRepository(context));
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.SaveChanges();
            await usersController.DeleteAsync(jwt);
            var user = await usersController.GetAsync(jwt);
            Assert.IsType<OkObjectResult>(user);
        }

        [Fact]
        public async Task RegisterNotExistingUser_WithValidCredentials_ReturnCreatedAtActionResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDataBase")
                              .Options;
            var context = new DataContext(options);
            UsersController usersController = new UsersController(new UsersRepository(context));

            var result = await usersController.RegisterGuestAsync(new UserRegisterDto()
            {
                Username = "Andrei1",
                Email = "andrei1@gmail.com",
                Password = "1234"
            });
            Assert.IsType<CreatedAtActionResult>(result);
        }

        [Fact]
        public async Task LoginExistingUser_WithCorrectCredentials_ReturnOkObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "LoginUsersDataBase1")
                              .Options;
            var context = new DataContext(options);
            UsersController usersController = new UsersController(new UsersRepository(context));

            context.Add(GetTestUser(1));
            context.SaveChanges();

            var result1 = await usersController.LoginAsync(new UserCredentialsDto()
            {
                Email= "has@gmail.com",
                Password =  "123"
            });
            Assert.IsType<OkObjectResult>(result1);
        }

        [Fact]
        public async Task LoginNonExistingUser_ReturnBadRequestObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "LoginUsersDataBase2")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new UsersController(new UsersRepository(context));

            context.Add(GetTestUser(1));
            context.SaveChanges();

            var result = await usersController.LoginAsync(new UserCredentialsDto()
            {
                Email = "notdexter@gmail.com",
                Password = "otherpassword"
            });
            Assert.IsType<BadRequestObjectResult>(result);
        }
    }
}
