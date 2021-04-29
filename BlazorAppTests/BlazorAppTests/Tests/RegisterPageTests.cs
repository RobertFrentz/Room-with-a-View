using System;
using BlazorAppTests.Helpers;
using BlazorAppTests.PageObjects;
using Xunit;

namespace BlazorAppTests.Tests
{
    public class RegisterPageTests : Browser, IDisposable
    {
        public LoginPage loginPage;
        public RegisterPage registerPage;

        [Fact]
        public void Register_ValidCredentials_SuccessRegister()
        {
            Driver.Navigate().GoToUrl("https://localhost:44331/register");
            registerPage = new RegisterPage(Driver);
            registerPage.Register("roleo@gmail.com", "roleo", "jmecheru", "jmecheru");
            loginPage = new LoginPage(Driver);
            Assert.True(loginPage.title.Displayed);
        }

        [Fact]
        public void Register_ExistentEmail_FailedRegister()
        {
            Driver.Navigate().GoToUrl("https://localhost:44331/register");
            registerPage = new RegisterPage(Driver);
            registerPage.Register("admin@gmail.com", "adminul", "admin", "admin");
            Assert.Equal("Attention! Email already exists.", registerPage.alertBox.Text);
        }

        [Fact]
        public void Register_ExistentUsername_FailedRegister()
        {
            Driver.Navigate().GoToUrl("https://localhost:44331/register");
            registerPage = new RegisterPage(Driver);
            registerPage.Register("adminul@gmail.com", "admin", "admin", "admin");
            Assert.Equal("Attention! Username already exists.", registerPage.alertBox.Text);
        }

        [Fact]
        public void Register_UnmatchedPasswords_FailedRegister()
        {
            Driver.Navigate().GoToUrl("https://localhost:44331/register");
            registerPage = new RegisterPage(Driver);
            registerPage.Register("admin@gmail.com", "admin", "adminul", "admin");
            Assert.Equal("Attention! Passwords don't match!.", registerPage.alertBox.Text);
        }

        public void Dispose()
        {
            CloseBrowser();
        }
    }
}