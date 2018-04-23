/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Error.h
 * Author: root
 *
 * Created on April 20, 2018, 9:20 PM
 */

#ifndef ERROR_H
#define ERROR_H

#ifdef __cplusplus
extern "C" {
#endif

void FatalError(const char *);
void Error(const char *);


#ifdef __cplusplus
}
#endif

#endif /* ERROR_H */

