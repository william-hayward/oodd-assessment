/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package org.solent.com504.oodd.web.properties;

import java.io.File;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author acer
 */
public class PropertiesDaoFileTest {

    public final String Properties_Test = "/bankdetails.properties";

    public PropertiesDaoFileTest() {
    }

    @org.junit.BeforeClass
    public static void setUpClass() throws Exception {
    }

    @org.junit.AfterClass
    public static void tearDownClass() throws Exception {
    }

    @org.junit.Before
    public void setUp() throws Exception {
    }

    @org.junit.After
    public void tearDown() throws Exception {
    }

    @Before
    public void before() {
        // make sue file doesnt exist
        File propertiesFile = new File(Properties_Test);
        if (propertiesFile.exists()) {
            propertiesFile.delete();
        }
    }

    /**
     * Test of getProperty method, of class PropertiesDaoFile.
     */
    @org.junit.Test
    public void testGetProperty() {
        System.out.println("getProperty");
        PropertiesDaoFile propertiesDaoFile = new PropertiesDaoFile(Properties_Test);
        propertiesDaoFile.setProperty("org.solent.ood.simplepropertiesdaowebapp.testPropertiesFile", Properties_Test);
        propertiesDaoFile.setProperty("org.solent.com504.oodd.web.cardto", "testcardto");
        propertiesDaoFile.setProperty("org.solent.com504.oodd.web.cardtoname", "testcardname");
        propertiesDaoFile.setProperty("org.solent.com504.oodd.web.cardtoexpdate", "testcarddate");
        propertiesDaoFile.setProperty("org.solent.com504.oodd.web.cardtocvv", "testcardcvv");

        String testcardname = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtoname");
        assertEquals("testcardname", testcardname);

        String testcardto = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardto");
        assertEquals("testcardto", testcardto);

        String testcardcvv = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtocvv");
        assertEquals("testcardcvv", testcardcvv);

        String testcarddate = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtoexpdate");
        assertEquals("testcarddate", testcarddate);

    }

}
