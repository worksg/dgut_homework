package com.jsp;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
public class Student {

    private long classno;
    private String name;
    private int age;
    private boolean sex;
    private String major;

    public Student() {
    }

    /**
     * @return the classno
     */
    public long getClassno() {
        return classno;
    }

    /**
     * @param classno the classno to set
     */
    public void setClassno(long classno) {
        this.classno = classno;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the age
     */
    public int getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
    }

    /**
     * @return the sex
     */
    public boolean isSex() {
        return sex;
    }

    /**
     * @param sex the sex to set
     */
    public void setSex(boolean sex) {
        this.sex = sex;
    }

    /**
     * @return the major
     */
    public String getMajor() {
        return major;
    }

    /**
     * @param major the major to set
     */
    public void setMajor(String major) {
        this.major = major;
    }

    public static void main(String[] args) {
        System.out.println("test JavaBean!");
        Student a = new Student();
        a.setAge(27);
        a.setClassno(1001);
        a.setSex(true);
        a.setMajor("computer");
        System.out.println("the name is " + a.getName());
        System.out.println("the major is " + a.getName());
        if (a.isSex()) {
            System.out.println("it is male");
        } else {
            System.out.println("it is female");
        }
    }
}
