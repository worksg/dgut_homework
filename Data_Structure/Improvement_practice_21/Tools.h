/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Tools.h
 * Author: root
 *
 * Created on April 20, 2018, 8:37 PM
 */

#ifndef TOOLS_H
#define TOOLS_H

#ifdef __cplusplus
extern "C" {
#endif

const ElementType query_name(const char * Key, const HashTable H);

const ElementType query_phone(const char * Key, const HashTable H);

void read_file(HashTable H_name_index, HashTable H_phone_index);

#define MAX_LINE 120
#define NAME_LENGTH 30
#define PHONE_LENGTH 20
#define ADDRESS_LENGTH 50

#ifdef __cplusplus
}
#endif

#endif /* TOOLS_H */

