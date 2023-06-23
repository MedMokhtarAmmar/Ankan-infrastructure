package SelenuimTests;

import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static junit.framework.Assert.assertTrue;

public class T2_ProjectCourtier extends T1_SignIn {

     @Test
     public void AddProjectSuccessfully() throws InterruptedException {
         WebDriverWait wait = new WebDriverWait(driver, 20);
         SignWithCourtier();
         driver.findElement(By.xpath(".//a[@href='/courtier/creer-projet']")).click();
         wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("btn-default")));
         driver.findElement(By.id("projectName")).sendKeys("project");
         driver.findElement(By.id("clientFirstName")).sendKeys("client");

         driver.findElement(By.id("clientLastName")).sendKeys("client");
         driver.findElement(By.id("inputEmail4")).sendKeys("client@client.com");

         driver.findElement(By.id("nameClient")).sendKeys("12345678");

         driver.findElement(By.id("submitbutton")).click();
         Thread.sleep(2000);
           assertTrue("cannot add project ", driver.getPageSource().contains("Votre projet a été créé"));

     }

    @Test
    public void AddProjectwithWrongEMail() throws InterruptedException {
        WebDriverWait wait = new WebDriverWait(driver, 20);
        SignWithCourtier();
        driver.findElement(By.xpath(".//a[@href='/courtier/creer-projet']")).click();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("btn-default")));
        driver.findElement(By.id("projectName")).sendKeys("project");
        driver.findElement(By.id("clientFirstName")).sendKeys("client");

        driver.findElement(By.id("clientLastName")).sendKeys("client");
        driver.findElement(By.id("inputEmail4")).sendKeys("client.com");

        driver.findElement(By.id("nameClient")).sendKeys("12345678");

        driver.findElement(By.id("submitbutton")).click();

        Thread.sleep(2000);
     assertTrue("cannot add project ", driver.getPageSource().contains("Merci de vérifier votre saisie"));

    }
    @Test
    public void AddProjectwithInexistEMail() throws InterruptedException {
        WebDriverWait wait = new WebDriverWait(driver, 20);
        SignWithCourtier();
        driver.findElement(By.xpath(".//a[@href='/courtier/creer-projet']")).click();
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("btn-default")));
        driver.findElement(By.id("projectName")).sendKeys("project");
        driver.findElement(By.id("clientFirstName")).sendKeys("client");

        driver.findElement(By.id("clientLastName")).sendKeys("client");
        driver.findElement(By.id("inputEmail4")).sendKeys("rere@ree.com");

        driver.findElement(By.id("nameClient")).sendKeys("12345678");

        driver.findElement(By.id("submitbutton")).click();
        Thread.sleep(2000);
        assertTrue("error" ,driver.findElement(By.xpath("/html/body/app-root/app-courtier/div/app-afficher-details-projet-courtier/main/div/div[2]/div/div/div/i")).isDisplayed());
        assertTrue("cannot add project ", driver.getPageSource().contains("Votre projet a été créé"));

    }

}

