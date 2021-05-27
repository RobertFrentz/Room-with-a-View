using Microsoft.EntityFrameworkCore;
using UserManagementMicroservice.Repositories;
using UserManagementMicroservice.Entities;
using UserManagementMicroservice.Utils;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Xunit;
using UserManagementMicroservice.Controllers;
using System.Linq;
using System.Collections.Generic;
using UserManagementMicroservice.DTOs;
using Newtonsoft.Json.Linq;
using static UserManagementTests.GenerateDataForUnitTests;
namespace UserManagementTests
{
    public class UserControllerUnitTest
    {
        readonly string AdminJwt = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XL0";

        [Fact]
        public async Task GetAllExistingUsers_ReturnAIEnurambleOfRegisteredUsersAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUsersDatabase")
                              .Options;
            var context = new DataContext(options);
            var jwt = Jwt.CreateJWT(GetTestUser(2).Id, 1);
            context.Add(GetTestUser(1));
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.GetAllAsync(jwt) as OkObjectResult;
            var users = result.Value as IEnumerable<User>;
            Assert.Equal(GetTestUser(1).Id, users.ElementAt(0).Id);
            Assert.Equal(GetTestUser(2).Id, users.ElementAt(1).Id);
        }

        [Fact]
        public async Task GetAllExistingUsers_ReturnUnauthorizedObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUsersDatabaseReturnUnauthorized")
                              .Options;
            var context = new DataContext(options);
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.GetAllAsync(jwt);
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLc")]
        public void CheckAuthorization_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            UsersController usersController = new();

            var result = usersController.CheckAuth(authorizationToken);
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public void CheckAuthorization_ReturnOkObjectResult()
        {
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            UsersController usersController = new();

            var result = usersController.CheckAuth(jwt);
            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task GetAdminPrivileges_ReturnUnauthorizedObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetAdminPrivilegesUnauthorized")
                              .Options;
            var context = new DataContext(options);
            var authToken = Jwt.CreateJWT(GetTestUser(1).Id, 1);

            context.Add(GetTestUser(1));
            context.SaveChanges();

            UsersController usersController = new(new UsersRepository(context));

            var jsonObjectResult = usersController.CheckAuth(authToken) as ObjectResult;
            var result = await usersController.VerifyAdminPrivileges(jsonObjectResult.Value.ToString());
            Assert.IsType<UnauthorizedObjectResult>(result);
        }
        [Fact]
        public async Task GetAdminPrivileges_ReturnOkObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetAdminPrivileges")
                              .Options;
            var context = new DataContext(options);
            var authToken = Jwt.CreateJWT(GetTestUser(2).Id, 1);

            context.Add(GetTestUser(2));
            context.SaveChanges();

            UsersController usersController = new(new UsersRepository(context));

            var jsonObjectResult = usersController.CheckAuth(authToken) as ObjectResult;
            var result = await usersController.VerifyAdminPrivileges(jsonObjectResult.Value.ToString());
            Assert.IsType<OkObjectResult>(result);
        }
        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async Task GetExistingUserById_NoAuthorization_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUserSpecifiedDatabaseUnauthorized")
                              .Options;
            var context = new DataContext(options);
            context.Add(GetTestUser(1));
            context.SaveChanges();

            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.GetByIdAsync(authorizationToken) as ObjectResult;

            Assert.IsType<UnauthorizedObjectResult>(result);
        }
        [Fact]
        public async Task GetExistingUserById_ReturnASpecifiedUserByIdAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUserSpecifiedDatabase")
                              .Options;
            var context = new DataContext(options);
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.SaveChanges();

            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.GetByIdAsync(jwt) as OkObjectResult;
            var user1 = result.Value as User;

            Assert.Equal(GetTestUser(1).Id, user1.Id);
        }
        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async Task GetUsername_NoAuthorization_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUsernameDatabaseUnauthorized")
                              .Options;
            var context = new DataContext(options);
            context.Add(GetTestUser(1));
            context.SaveChanges();

            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.GetByIdAsync(authorizationToken) as ObjectResult;

            Assert.IsType<UnauthorizedObjectResult>(result);
        }
        [Fact]
        public async Task GetExistingUser_ReturnUsernameOfTheExistingUserAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUsernameDatabase")
                              .Options;
            var context = new DataContext(options);
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.SaveChanges();

            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.GetUsernameAsync(jwt) as OkObjectResult;
            var user = JObject.Parse((string)result.Value);

            Assert.Equal(GetTestUser(1).Username, user["username"]);
        }

        [Fact]
        public async Task GetNonExistingUser_ReturnNotFoundObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "GetUsernameDatabaseNotFound")
                              .Options;
            var context = new DataContext(options);
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(2));
            context.SaveChanges();

            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.GetUsernameAsync(jwt);
            Assert.IsType<NotFoundObjectResult>(result);
        }

        [Theory]
        [ClassData(typeof(GenerateDataForUnitTests))]
        public async Task RegisterUser_ReturnConflictObjectResultAsync(UserRegisterDto userRegisterDto, int role)
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUserDatabaseRegisterConflict")
                              .Options;
            var context = new DataContext(options);
            context.Add(GetTestUser(role + 1));
            context.SaveChanges();

            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.RegisterAsync(userRegisterDto, role);
            Assert.IsType<ConflictObjectResult>(result);
        }
        [Fact]
        public async Task RegisterNonExistingUser_WithValidCredentials_ReturnCreatedAtActionResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDatabaseGuestRole")
                              .Options;
            var context = new DataContext(options);
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.RegisterGuestAsync(new UserRegisterDto()
            {
                Username = "Andrei1",
                Email = "andrei1@gmail.com",
                Password = "1234"
            });
            Assert.IsType<CreatedAtActionResult>(result);
        }
        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async Task RegisterNonExistingAdmin_AuthorizationTokenInvalid_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDatabaseAdminRoleTokenInvalid")
                              .Options;
            var context = new DataContext(options);
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.RegisterAdminAsync(authorizationToken, new UserRegisterDto()
            {
                Username = "adminTest",
                Email = "adminTest@gmail.com",
                Password = "1234"
            });
            Assert.IsType<UnauthorizedObjectResult>(result);
        }
        [Fact]
        public async Task RegisterNonExistingAdmin_NoAdminPrivileges_ReturnUnauthorizedObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDatabaseNoAdminRole")
                              .Options;
            var context = new DataContext(options);
            var authToken = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.RegisterAdminAsync(authToken, new UserRegisterDto()
            {
                Username = "adminTest",
                Email = "adminTest@gmail.com",
                Password = "1234"
            });
            Assert.IsType<UnauthorizedObjectResult>(result);
        }
        [Fact]
        public async Task RegisterNonExistingAdmin_WithValidCredentials_ReturnCreatedAtActionResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDatabaseAdminRole")
                              .Options;
            var context = new DataContext(options);
            var authToken = Jwt.CreateJWT(GetTestUser(2).Id, 1);
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.RegisterAdminAsync(authToken, new UserRegisterDto()
            {
                Username = "adminTest",
                Email = "adminTest@gmail.com",
                Password = "1234"
            });
            Assert.IsType<CreatedAtActionResult>(result);
        }
        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async Task RegisterNonExistingStaff_AuthorizationTokenInvalid_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDatabaseStaffRoleInvalidToken")
                              .Options;
            var context = new DataContext(options);
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.RegisterAdminAsync(authorizationToken, new UserRegisterDto()
            {
                Username = "adminTest",
                Email = "adminTest@gmail.com",
                Password = "1234"
            });
            Assert.IsType<UnauthorizedObjectResult>(result);
        }
        [Fact]
        public async Task RegisterNonExistingStaff_NoAdminPrivileges_ReturnUnauthorizedObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDatabaseStaffRoleNoAdmin")
                              .Options;
            var context = new DataContext(options);
            var authToken = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.RegisterAdminAsync(authToken, new UserRegisterDto()
            {
                Username = "adminTest",
                Email = "adminTest@gmail.com",
                Password = "1234"
            });
            Assert.IsType<UnauthorizedObjectResult>(result);
        }

        [Fact]
        public async Task RegisterNonExistingStaff_WithValidCredentials_ReturnCreatedAtActionResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PostUsersDatabaseStaffRole")
                              .Options;
            var context = new DataContext(options);
            var authToken = Jwt.CreateJWT(GetTestUser(2).Id, 1);
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UsersController usersController = new(new UsersRepository(context));

            var result = await usersController.RegisterStaffAsync(authToken, new UserRegisterDto()
            {
                Username = "staffTest",
                Email = "staffTest@gmail.com",
                Password = "1234"
            });
            Assert.IsType<CreatedAtActionResult>(result);
        }
        [Fact]
        public async Task LoginNonExistingUser_ReturnBadRequestObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "LoginUsersDatabase1")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new(new UsersRepository(context));

            context.Add(GetTestUser(1));
            context.SaveChanges();

            var result = await usersController.LoginAsync(new UserCredentialsDto()
            {
                Email = "notdexter@gmail.com",
                Password = "otherpassword"
            });
            Assert.IsType<BadRequestObjectResult>(result);
        }
        [Fact]
        public async Task LoginExistingUser_WithCorrectCredentials_ReturnOkObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "LoginUsersDatabase2")
                              .Options;
            var context = new DataContext(options);
            UsersController usersController = new(new UsersRepository(context));

            context.Add(GetTestUser(1));
            context.SaveChanges();

            var result1 = await usersController.LoginAsync(new UserCredentialsDto()
            {
                Email = "has@gmail.com",
                Password = "123"
            });
            Assert.IsType<OkObjectResult>(result1);
        }

        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async Task UpdatingExistingUser_TokenInvalid_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PutUserSpecifiedDatabaseUnauthorized")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new(new UsersRepository(context));

            context.Add(GetTestUser(1));
            context.SaveChanges();
            UserRegisterDto user1 = new() { Username = "Dorel", Password = "123", Email = "has@gmail.com" };
            var requestForUser1 = await usersController.UpdateAsync(user1, authorizationToken);
            Assert.IsType<UnauthorizedObjectResult>(requestForUser1);

        }

        [Fact]
        public async Task UpdatingExistingUser_ReturnNoContentResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PutUserSpecifiedDatabase")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new(new UsersRepository(context));
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.SaveChanges();
            UserRegisterDto user1 = new() { Username = "Dorel", Password = "123", Email = "has@gmail.com" };
            var requestForUser1 = await usersController.UpdateAsync(user1, jwt);
            Assert.IsType<NoContentResult>(requestForUser1);

        }
        [Fact]
        public async Task UpdatingNonExistingUser_ReturnNotFoundObjectResultAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "PutUserSpecifiedDatabaseNotFound")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new(new UsersRepository(context));
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(2));
            context.SaveChanges();
            UserRegisterDto user1 = new() { Username = "Dorel", Password = "123", Email = "has@gmail.com" };
            var requestForUser1 = await usersController.UpdateAsync(user1, jwt);
            Assert.IsType<NotFoundObjectResult>(requestForUser1);

        }

        [Theory]
        [InlineData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjMyOTEwNDYsInVzZXJJZCI6MTV9.7_eU9SCtQ-CtzGxYG38HrgJkOWLB5IMWkIfuMfh9XLa")]
        public async Task DeleteExistingUser_TokenInvalid_ReturnUnauthorizedObjectResultAsync(string authorizationToken)
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                             .UseInMemoryDatabase(databaseName: "DeleteUsersDatabaseUnauthorized")
                             .Options;
            var context = new DataContext(options);

            UsersController usersController = new(new UsersRepository(context));
            context.Add(GetTestUser(1));
            context.SaveChanges();
            var result = await usersController.DeleteAsync(authorizationToken);

            Assert.IsType<UnauthorizedObjectResult>(result);

        }
        [Fact]
        public async Task DeleteExistingUser_GetThatUserById_ReturnNullAsync()
        {
            var options = new DbContextOptionsBuilder<DataContext>()
                              .UseInMemoryDatabase(databaseName: "DeleteUsersDatanase")
                              .Options;
            var context = new DataContext(options);

            UsersController usersController = new(new UsersRepository(context));
            var jwt = Jwt.CreateJWT(GetTestUser(1).Id, 1);
            context.Add(GetTestUser(1));
            context.SaveChanges();
            await usersController.DeleteAsync(jwt);
            var user = await usersController.GetByIdAsync(jwt);
            Assert.IsType<OkObjectResult>(user);
        }
    }
}
