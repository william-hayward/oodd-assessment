/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.solent.com504.oodd.web.properties;

import java.io.File;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class PropertiesFileFactory {

    final static Logger LOG = LogManager.getLogger(PropertiesFileFactory.class);

    private static PropertiesDaoFile propertiesDaoFile = null;

    public static PropertiesDaoFile getPropertiesDaoFile() {
        if (propertiesDaoFile == null) {
            synchronized (PropertiesFileFactory.class) {
                if (propertiesDaoFile == null) {
                    // creates a single instance of the dao
                    String TEMP_DIR = System.getProperty("java.io.tmpdir");
                    File propertiesFile = new File(TEMP_DIR + "/bankdetails.properties");
                    LOG.debug("using system temp directory: " + TEMP_DIR);
                    LOG.debug("using application properties file : " + propertiesFile.getAbsolutePath());
                    propertiesDaoFile = new PropertiesDaoFile(propertiesFile.getAbsolutePath());
                }
            }
        }
        return propertiesDaoFile;
    }

}
