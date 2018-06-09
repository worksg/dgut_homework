/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package JavaBean;

import java.util.Date;
import java.util.Random;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean
@RequestScoped
public class UserBean {
    protected String firstName;
    protected String lastName;
    protected Date dob;
    protected String sex;
    protected String email;

    public UserBean() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String addUser(){
        boolean added=true; //actual application may fail to add user
        //生成随机数
        Random randomGR = new Random();
        int randomInt=new Integer(randomGR.nextInt(10));
        if(randomInt<5)added = false;
        else added=true;
        String outcome=null;
        if(added) outcome="done";
        else outcome="reg2";
        return outcome;
    }
    
}
