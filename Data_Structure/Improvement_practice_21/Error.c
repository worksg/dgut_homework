/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include <stdio.h>

void
Error(const char * string) {
    printf("Error %s\n", string);
}

void
FatalError(const char * string) {
    printf("FatalError %s\n", string);
}
