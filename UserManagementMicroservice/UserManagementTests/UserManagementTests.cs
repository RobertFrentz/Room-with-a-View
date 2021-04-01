using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using UserManagementMicroservice.Data;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;
using System.Threading.Tasks;
using UserManagementMicroservice;
using System.Text;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using System;
using Xunit;
using UserManagementMicroservice.Controllers;
using Assert = Xunit.Assert;
using System.Linq;

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
                    Email = Cryptography.HashString("has@gmail.com")
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
            context.Add(GetTestUser(1));
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new UsersController(new UsersRepository(context));

            var result = await usersController.GetAsync();
            Assert.Equal(GetTestUser(1).Id, result.ElementAt(0).Id);
            Assert.Equal(GetTestUser(2).Id, result.ElementAt(1).Id);
        }

        [Fact]
        public async Task GetExistingUserById_ReturnASpecifiedUserByIdAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUserSpecifiedDataBase")
                              .Options;
            var context = new DataContext(options);
            context.Add(GetTestUser(1));
            context.Add(GetTestUser(2));
            context.SaveChanges();

            UsersController usersController = new UsersController(new UsersRepository(context));

            var user1 = await usersController.GetByIdAsync(1);
            var user2 = await usersController.GetByIdAsync(2);

            Assert.Equal(GetTestUser(1).Id,user1.Id);
            Assert.Equal(GetTestUser(2).Id,user2.Id);
        }


        [Fact]
        public async Task UpdatingNonExistingUser_ReturnNotFoundObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PutUserSpecifiedDataBase")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new UsersController(new UsersRepository(context));
            context.Add(new User()
            {
                Username = "Mirel",
                Password = Cryptography.HashString("123"),
                Email = Cryptography.HashString("has@gmail.com")
            });
            context.SaveChanges();
            User user1 = new() { Username = "Dorel", Password = "123", Email = "has@gmail.com" };
            var requestForUser1 = await usersController.UpdateAsync(user1, AdminJWT);
            Assert.IsType<NotFoundObjectResult>(requestForUser1);

        }

        [Fact]
        public async Task DeleteExistingUser_GetThatUserById_ReturnNullAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "DeleteUsersDataBase")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new UsersController(new UsersRepository(context));

            context.Add(new User()
            {
                Id = 1,
                Username = "Mitica",
                Email = Cryptography.HashString("mitica@gmail.com"),
                Password = Cryptography.HashString("123")
            });
            context.SaveChanges();
            await usersController.DeleteAsync(1);
            var user = await usersController.GetByIdAsync(1);
            Assert.Null(user);
        }

        [Fact]
        public async Task RegisterNotExistingUser_WithValidCredentials_ReturnOkResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDataBase")
                              .Options;
            var context = new DataContext(options);
            UsersController usersController = new UsersController(new UsersRepository(context));

            var result = await usersController.RegisterAsync(new UserRegister()
            {
                Username = "Andrei1",
                Email = "andrei1@gmail.com",
                Password = "1234"
            });
            Assert.IsType<OkResult>(result);
        }

        [Fact]
        public async Task LoginExistingUser_WithCorrectCredentials_ReturnOkObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "LoginUsersDataBase")
                              .Options;
            var context = new DataContext(options);
            UsersController usersController = new UsersController(new UsersRepository(context));

            context.Add(new User()
            {
                Username = "Dexter",
                Email = Cryptography.HashString("dexter@gmail.com"),
                Password = Cryptography.HashString("123")
            });
            context.SaveChanges();
            var result1 = await usersController.LoginAsync(new UserCredentials()
            {
                Email= "dexter@gmail.com",
                Password =  "123"
            });
            Assert.IsType<OkObjectResult>(result1);
        }

        [Fact]
        public async Task LoginNonExistingUser_ReturnNotFoundObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "LoginUsersDataBase")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new UsersController(new UsersRepository(context));

            context.Add(new User()
            {
                Username = "Dexter",
                Email = Cryptography.HashString("dexter@gmail.com"),
                Password = Cryptography.HashString("123")
            });
            context.SaveChanges();
            var result = await usersController.LoginAsync(new UserCredentials()
            {
                Email = "notdexter@gmail.com",
                Password = "otherpassword"
            });
            Assert.IsType<NotFoundObjectResult>(result);
        }
    }
}
