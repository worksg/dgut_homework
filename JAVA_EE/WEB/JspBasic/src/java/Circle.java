
import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author root
 */
public class Circle extends Applet {
    public void paint(Graphics g) {
        g.setColor(new Color(255,0,255));
        g.fillArc(0,0,50,50,0,360);
    }
}
