/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package JavaBean;

import javax.faces.bean.ManagedBean;


@ManagedBean
public class Message {  
    private String world ="Hello World!";

    public Message() {
    }

    public String getWorld() {
        return world;
    }

    public void setWorld(String world) {
        this.world = world;
    }
    
    
    
}
