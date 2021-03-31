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
        public async void ValidAdministrator_GetUsers_ReturnAListOfRegisteredUsers()
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
            int enumId = 1;
            int copyId = 1;
            string copyUsername = "Test One";
            string copyPassword = "123";
            string copyEmail = "has@gmail.com";
            foreach (var item in result)
            {
                if (enumId == 2)
                {
                    copyId = enumId;
                    copyUsername = "Test Two";
                    copyPassword = "123";
                    copyEmail = "mist@gmail.com";
                }
                Assert.Equal(enumId, item.Id);
                Assert.Equal(copyUsername, item.Username);
                Assert.Equal(Cryptography.HashString(copyPassword), item.Password);
                Assert.Equal(Cryptography.HashString(copyEmail), item.Email);
                enumId += 1;
            }
        }

        [Fact]
        public async void ValidAdministrator_GetUser_ReturnASpecifiedUserByEmail()
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

            Assert.Equal("Test One", user1.Username);
            Assert.Equal(Cryptography.HashString("123"), user1.Password);
            Assert.Equal(Cryptography.HashString("has@gmail.com"), user1.Email);
            Assert.Equal("Test Two", user2.Username);
            Assert.Equal(Cryptography.HashString("123"), user2.Password);
            Assert.Equal(Cryptography.HashString("mist@gmail.com"), user2.Email);
        }


        [Fact]
        public async void UpdatingAnExistingUser_ReturnNoContent()
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
            await context.SaveChangesAsync();
            User user1 = new() { Username = "Dorel", Password = "123", Email = "has@gmail.com" };
            var requestForUser1 = await usersController.UpdateAsync(user1, AdminJWT);
            Assert.IsType<NotFoundObjectResult>(requestForUser1);

        }

        [Fact]
        public async void DeleteExistingUser_ReturnNoContent()
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
            await context.SaveChangesAsync();
            await usersController.DeleteAsync(1);
            var user = await usersController.GetByIdAsync(1);
            Assert.Null(user);
        }

        [Fact]
        public async void RegisterNotExistingUser_WithMatchingPasswords_ReturnListWithJWTAndUsername()
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
            var result1 = await usersController.RegisterAsync(new UserRegister()
            {
                Username = "Andrei1",
                Email = "mist@gmail.com",
                Password = "123"

            });
            var result2 = await usersController.RegisterAsync(new UserRegister()
            {
                Username = "Marian",
                Email = "andrei1@gmail.com",
                Password = "123"

            });
            Assert.IsType<OkResult>(result);
            Assert.IsType<ConflictObjectResult>(result1);
            Assert.IsType<ConflictObjectResult>(result2);
        }

        [Fact]
        public async void LoginExistingUser_WithCorrectCredentials_ReturnListWithJWTAndUsername()
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
            await context.SaveChangesAsync();
            var result =await usersController.LoginAsync(new UserCredentials()
            {
                Email= "dexter@gmail.com",
                Password =  "123"
            });
            var result1 = await usersController.LoginAsync(new UserCredentials()
            {
                Email = "notdexter@gmail.com",
                Password = "otherpassword"
            });
            Assert.IsType<OkObjectResult>(result);
            Assert.IsType<NotFoundObjectResult>(result1);
        }

    }
}
