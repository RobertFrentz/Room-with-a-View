using System;
using BlazorAppTests.Helpers;
using BlazorAppTests.PageObjects;
using Xunit;

namespace BlazorAppTests.Tests
{
    public class LoginPageTests : Browser, IDisposable
    {
        public LoginPage loginPage;
        public HomePage homePage;
      
        [Fact]
        public void Login_ValidCredentials_SuccessLogin()
        {
            Driver.Navigate().GoToUrl("https://localhost:5001/login");
            loginPage = new LoginPage(Driver);
            loginPage.Login("admin@gmail.com", "admin");
            homePage = new HomePage(Driver);
            Assert.True(homePage.title.Displayed);
        }

        [Fact]
        public void Login_InvalidEmail_FailedLogin()
        {
            Driver.Navigate().GoToUrl("https://localhost:5001/login");
            loginPage = new LoginPage(Driver);
            loginPage.Login("adminul@gmail.com", "admin");
            Assert.Equal("Attention! Email or password invalid.", loginPage.alertBox.Text);
        }

        [Fact]
        public void Login_IncorrectPassword_FailedLogin()
        {
            Driver.Navigate().GoToUrl("https://localhost:5001/login");
            loginPage = new LoginPage(Driver);
            loginPage.Login("admin@gmail.com", "adminul");
            Assert.Equal("Attention! Email or password invalid.", loginPage.alertBox.Text);
        }

        public void Dispose()
        {
            CloseBrowser();
        }
    }
}
