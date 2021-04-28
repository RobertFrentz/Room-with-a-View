using System;
using BlazorAppTests.Helpers;
using BlazorAppTests.PageObjects;
using Xunit;

namespace BlazorAppTests.Tests
{
    public class TestClass : Browser, IDisposable
    {
        public LoginPage loginPage;
        public HomePage homePage;
      
        [Fact]
        public void Login_ValidCredentials_SuccessLogin()
        {
            Driver.Navigate().GoToUrl("https://localhost:44331/login");
            loginPage = new LoginPage(Driver);
            loginPage.Login("bobitz@gmail.com", "jmecheru");
            homePage = new HomePage(Driver);
            Assert.True(homePage.title.Displayed);
        }

        [Fact]
        public void Login_InvalidEmail_FailedLogin()
        {
            Driver.Navigate().GoToUrl("https://localhost:44331/login");
            loginPage = new LoginPage(Driver);
            loginPage.Login("robert@gmail.com", "jmecheru");
            homePage = new HomePage(Driver);
            Assert.Equal("Attention! Email or password invalid.", loginPage.alertBox.Text);
        }

        public void Dispose()
        {
            CloseBrowser();
        }
    }
}
