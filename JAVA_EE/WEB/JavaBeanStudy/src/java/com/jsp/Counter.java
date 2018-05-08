/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jsp;

/**
 *
 * @author Administrator
 */
public class Counter {
    private int count = 0;
    public Counter(){}

    /**
     * @return the count
     */
    public int getCount() {
        return ++count;
    }

    /**
     * @param count the count to set
     */
    public void setCount(int count) {
        this.count = count;
    }
    
}
