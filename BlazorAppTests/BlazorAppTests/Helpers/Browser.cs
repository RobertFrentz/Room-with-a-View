using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;

namespace BlazorAppTests.Helpers
{
    public class Browser
    {
        protected IWebDriver Driver;

        public Browser()
        {
            var op = new FirefoxOptions()
            {
                AcceptInsecureCertificates = true
            };
            Driver = new FirefoxDriver(op);
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
