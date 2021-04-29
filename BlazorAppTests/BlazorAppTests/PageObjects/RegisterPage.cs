using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlazorAppTests.PageObjects
{
    public class RegisterPage : BasePage
    {
        public RegisterPage(IWebDriver driver)
        {
            this.driver = driver;
            PageFactory.InitElements(this, new RetryingElementLocator(this.driver, TimeSpan.FromSeconds(20)));
        }
        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[2]/form/div[1]/input")]
        public IWebElement txtEmail { get; set; }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[2]/form/div[2]/input")]
        public IWebElement txtUsername { get; set; }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[2]/form/div[3]/input")]
        public IWebElement txtPassword { get; set; }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[2]/form/div[4]/input")]
        public IWebElement txtConfirmPassword { get; set; }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[2]/form/div[5]/input")]
        public IWebElement btnSignUp { get; set; }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[4]")]
        public IWebElement alertBox { get; set; }

        public void Register(string email, string username, string password, string confirmPassword)
        {
            txtEmail.SendKeys(email);
            txtUsername.SendKeys(username);
            txtPassword.SendKeys(password);
            txtConfirmPassword.SendKeys(confirmPassword);
            btnSignUp.Click();
        }

    }
}
