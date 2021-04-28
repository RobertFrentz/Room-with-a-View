using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlazorAppTests.PageObjects
{
    public class LoginPage : BasePage
    {
        public LoginPage(IWebDriver driver)
        {
            this.driver = driver;
            PageFactory.InitElements(this, new RetryingElementLocator(this.driver, TimeSpan.FromSeconds(20)));
        }
        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[2]/form/div[1]/input")]
        public IWebElement txtEmail { get; set; }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[2]/form/div[2]/input")]
        public IWebElement txtPassword { get; set; }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[2]/form/div[4]/input")]
        public IWebElement btnLogin { get; set; }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div/div[4]")]
        public IWebElement alertBox { get; set; }

        public void Login(string username, string password)
        {
            txtEmail.SendKeys(username);
            txtPassword.SendKeys(password);
            btnLogin.Click();
        }

    }
}
