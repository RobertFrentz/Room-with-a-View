using OpenQA.Selenium;
using SeleniumExtras.PageObjects;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlazorAppTests.PageObjects
{

    public class HomePage : BasePage
    {
        public HomePage(IWebDriver driver)
        {
            this.driver = driver;
            PageFactory.InitElements(this, new RetryingElementLocator(this.driver, TimeSpan.FromSeconds(20)));
        }

        [FindsBy(How = How.XPath, Using = "//*[@id='app']/div/div[2]/div/div[1]/h3")]
        public IWebElement title { get; set; }
    }
}
