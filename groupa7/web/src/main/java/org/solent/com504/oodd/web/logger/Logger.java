/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.solent.com504.oodd.web.logger;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 *
 * @author acer
 */
public class Logger {
    public static void Logger(String message){
        try{
            String timestamp = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
            FileWriter fw = new FileWriter("../logs/Transaction Logger.txt", true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(timestamp + " " + message);
            bw.newLine();
            bw.close();
        }
        catch(IOException e){
            System.out.println("Error writing to file");
        }
    }
}
