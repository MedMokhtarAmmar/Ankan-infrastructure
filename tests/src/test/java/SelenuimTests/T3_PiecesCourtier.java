package SelenuimTests;

import org.junit.Ignore;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;

public class T3_PiecesCourtier extends T1_SignIn {


    //Scroll down
    public void scroll() {
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("window.scrollBy(0,2000)", "");
    }

    @Test
    public void AccessToPieces() throws InterruptedException {
        SignWithCourtier();
        WebElement ButtonPieces = driver.findElement(By.xpath(".//a[@href='/courtier/pieces']"));
        ButtonPieces.click();
         Thread.sleep(2000);
     }


}