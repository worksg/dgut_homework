/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Administrator
 */
public class CounterFile {
    private BufferedReader file;
    public CounterFile(){}
    public String ReadFile(String filePath) throws FileNotFoundException {
        String currentRecord = null;
        file = new BufferedReader(new FileReader(filePath));
        String returnStr = null;
        try{
            currentRecord = file.readLine();
        }catch(IOException e) {
            System.out.print("Read Error");
        }
        if (currentRecord==null)
            returnStr = "None Record";
        else
            returnStr = currentRecord;
        
        return returnStr;
        
    }
    
    public synchronized void WriteFile(String filePath,String counter) throws FileNotFoundException {
        int Writestr = 0;
        Writestr = Integer.parseInt(counter);
        try{
            PrintWriter pw = new PrintWriter(new FileOutputStream(filePath));
            pw.println(Writestr);
            pw.close();
        }catch(IOException e) {
            System.out.print("Write Error " + e.getMessage());
        }
        
    }
}
