package SelenuimTests;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class T1_SignIn {
    public static WebDriver driver;
    protected  static final String URL_WEB = "https://app-uat.ankan.fr/";
    public    static   final String URL_SELENIUM_HUB = "http://selenium__standalone-chrome:4444/wd/hub";
    @Before
        public void before() throws MalformedURLException {
//        System.setProperty("webdriver.chrome.driver","/home/amin/Téléchargements/chromedriver");
//        driver = new ChromeDriver();

        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-dev-shm-usage", "-window-size=1920,1080");
        driver = new RemoteWebDriver(new URL(URL_SELENIUM_HUB),options);
        driver.get(URL_WEB);
       }

        public void StartLogin()  {
         driver.get("https://app-uat.ankan.fr/");
         driver.manage().window().maximize();
         driver.manage().timeouts().implicitlyWait(3000, TimeUnit.SECONDS);
        }

    @Test
    public void SignWithCourtier() {
        StartLogin();
        WebDriverWait wait = new WebDriverWait(driver, 20);
        driver.findElement(By.id("validationEmail")).sendKeys("courtier.courtier");
        driver.findElement(By.id("validationPassword")).sendKeys("123456");
        WebElement connexion = driver.findElement(By.xpath(".//button[@type='submit']"));
        connexion.click();
         wait.until(ExpectedConditions.invisibilityOf(connexion));
        String url = driver.getCurrentUrl();
        assertTrue("SignIn doesnt work", url.endsWith("courtier/accueil"));
    }
    @Test
    public void SignWithIncorrectCredentials() {
        StartLogin();
         driver.findElement(By.id("validationEmail")).sendKeys("user");
        driver.findElement(By.id("validationPassword")).sendKeys("1234567");
        WebElement connexion = driver.findElement(By.xpath(".//button[@type='submit']"));
        connexion.click();
        String url = driver.getCurrentUrl();
        assertFalse("SignIn doesnt work", url.endsWith("courtier/accueil"));
    }
    @Test
    public void SignClient() {
        StartLogin();
        driver.findElement(By.id("validationEmail")).sendKeys("client.client");
        driver.findElement(By.id("validationPassword")).sendKeys("123456");
        WebElement connexion = driver.findElement(By.xpath(".//button[@type='submit']"));
        connexion.click();
        String url = driver.getCurrentUrl();
        assertFalse("SignIn doesnt work", url.endsWith("client/accueil"));
    }

    @After
        public void after() {
         driver.quit();
        }
}
