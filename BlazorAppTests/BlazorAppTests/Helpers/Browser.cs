using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace BlazorAppTests.Helpers
{
    public class Browser
    {
        protected IWebDriver Driver;

        public Browser()
        {
            Driver = new ChromeDriver();
            Driver.Manage().Window.Maximize();
        }

        public void CloseBrowser()
        {
            Driver.Close();
            Driver.Quit();
            Driver.Dispose();
        }
    }
}
