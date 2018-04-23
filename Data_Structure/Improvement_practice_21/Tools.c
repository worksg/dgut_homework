/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "HashSep.h"
#include "Tools.h"
#include "Error.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void read_file(HashTable H_name_index, HashTable H_phone_index) {
    ElementType Key;

    FILE *ifp; //, *ofp;
    ifp = fopen("./in.list", "r");

    if (ifp == NULL) {
        fprintf(stderr, "Can't open input file in.list!\n");
        exit(1);
    }

    char * c = (char *) malloc(MAX_LINE * sizeof (char));
    char * name = (char *) malloc(NAME_LENGTH * sizeof (char));
    char * phone = (char *) malloc(PHONE_LENGTH * sizeof (char));
    char * address = (char *) malloc(ADDRESS_LENGTH * sizeof (char));

    //    char *c_ = c;
    //    char *name_ = name;
    //    char *phone_ = phone;
    //    char *address_ = address;

    //    char c[MAX_LINE];
    //    char * name [NAME_LENGTH];
    //    char * phone [PHONE_LENGTH];
    //    char * address [ADDRESS_LENGTH];

    memset(c, 0, MAX_LINE * sizeof (c[0]));
    memset(name, 0, NAME_LENGTH * sizeof (name[0]));
    memset(phone, 0, PHONE_LENGTH * sizeof (phone[0]));
    memset(address, 0, ADDRESS_LENGTH * sizeof (address[0]));


    while (!feof(ifp)) {
        fgets(c, MAX_LINE, ifp);
        if (strlen(c) >= MAX_LINE - 1) {
            printf("c length: %zd , %s", strlen(c), c);
            memset(name, 0, MAX_LINE * sizeof (c[0]));
            continue;
        }
        sscanf(c, "%s %s %s", name, phone, address);


        printf("name length: %zd , %s\n", strlen(name), name);
        printf("phone length: %zd , %s\n", strlen(phone), phone);
        printf("address length: %zd , %s\n", strlen(address), address);

        if (strlen(name) >= NAME_LENGTH || strlen(name) == 0
                || strlen(phone) >= PHONE_LENGTH || strlen(phone) == 0
                || strlen(address) >= ADDRESS_LENGTH || strlen(address) == 0) {
            memset(name, 0, strlen(name) * sizeof (name[0]));
            memset(phone, 0, strlen(phone) * sizeof (phone[0]));
            memset(address, 0, strlen(address) * sizeof (address[0]));
            memset(c, 0, MAX_LINE * sizeof (c[0]));
            continue;
        }

        Key = malloc(sizeof (struct ElementNode));
        if (Key == NULL) {
            FatalError("Out of memory!!!");
        } else {
            strncpy(Key->name, name, NAME_LENGTH * sizeof (name[0]));
            strncpy(Key->phone, phone, PHONE_LENGTH * sizeof (phone[0]));
            strncpy(Key->address, address, ADDRESS_LENGTH * sizeof (address[0]));
        }

        Insert(Key, H_name_index, "name");
        Insert(Key, H_phone_index, "phone");

        memset(name, 0, NAME_LENGTH * sizeof (name[0]));
        memset(phone, 0, PHONE_LENGTH * sizeof (phone[0]));
        memset(address, 0, ADDRESS_LENGTH * sizeof (address[0]));
        memset(c, 0, MAX_LINE * sizeof (c[0]));

    }

    fclose(ifp);

    //    free(address);
    //    free(phone);
    //    free(name);
    free(c);

    //    free(address_);
    //    free(phone_);
    //    free(name_);
    //    free(c_);






    //    ofp = fopen("./out.list", "w");
    //
    //    if (ofp == NULL) {
    //        fprintf(stderr, "Can't open output file %s!\n",
    //                "./out.list");
    //        exit(1);
    //    }

}

const ElementType query_phone(const char * Key, const HashTable H) {
    Position P = NULL;
    List L;

    L = H->TheLists[Hash(Key, H->TableSize)];
    P = L->Next;

    while (P != NULL && strcmp(P->Element->phone, Key) != 0) {
        P = P->Next;
    }

    if (P != NULL) {
        return P->Element;
    }
    return NULL;
}

const ElementType query_name(const char * Key, const HashTable H) {
    Position P = NULL;
    List L;

    L = H->TheLists[Hash(Key, H->TableSize)];
    P = L->Next;

    while (P != NULL && strcmp(P->Element->name, Key) != 0) {
        P = P->Next;
    }

    if (P != NULL) {
        return P->Element;
    }
    return NULL;
}
