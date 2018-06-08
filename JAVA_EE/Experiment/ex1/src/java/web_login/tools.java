/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web_login;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
/**
 *
 * @author Administrator
 */
public class tools {
    public static boolean isExist(String path) throws IOException {
    File file = new File(path);
        if (!file.exists() || file.length() == 0) {
            file.createNewFile();
            return false;
        }else{
            return true;
        }
        
    }
    public static void write(String file_path,String json) throws FileNotFoundException, UnsupportedEncodingException, IOException {
        FileOutputStream writerStream = new FileOutputStream(file_path,true);
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(writerStream, "UTF-8"));
        writer.write(json);
        writer.close();
    }
}

