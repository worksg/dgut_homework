/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   HashSep.h
 * Author: root
 *
 * Created on April 20, 2018, 8:38 PM
 */

#ifndef HASHSEP_H
#define HASHSEP_H

#ifdef __cplusplus
extern "C" {
#endif

struct ElementNode;
typedef struct ElementNode *ElementType;

struct ListNode;
typedef struct ListNode *Position;

typedef Position List;

struct HashTbl;
typedef struct HashTbl *HashTable;

struct ElementNode {
    char name[30];
    char phone[20];
    char address[50];
};

struct ListNode {
    ElementType Element;
    Position Next;
};

struct HashTbl {
    int TableSize;
    List *TheLists;
};


HashTable InitializeTable(const int TablesSize);
void DestroyTable(HashTable H);
const Position Find(const ElementType Key, const HashTable H,const char type[]);
void Insert(const ElementType Key, HashTable H,const char type[]);

typedef unsigned int Index;
Index Hash(const char *Key, int TableSize);


#ifdef __cplusplus
}
#endif

#endif /* HASHSEP_H */

