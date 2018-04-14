#include "HashSep.h"
#include<stdlib.h>
#include<stdio.h>
#include<string.h>

void
Error(const char * string) {
    printf("Error %s\n", string);
}

void
FatalError(const char * string) {
    printf("FatalError %s\n", string);
}

Index Hash(const char *Key, int TableSize) {
    unsigned int HashVal = 0;
    const char * read = Key;

    while (*Key != '\0') {
        HashVal = (HashVal << 5) + *Key++;
    }

    unsigned int Index = HashVal % TableSize;
    printf("Key:%s Index:%u\n", read, Index);

    return Index;
}

HashTable InitializeTable(const int TableSize) {
    HashTable H;
    int i;

    if (TableSize < 32) {
        Error("Table size too small");
        return NULL;
    }

    H = malloc(sizeof (struct HashTbl));
    if (H == NULL) {
        FatalError("Out of memory!!!");
    }

    H->TableSize = TableSize;

    H->TheLists = malloc(sizeof (List) * H->TableSize);
    if (H->TheLists == NULL) {
        FatalError("Out of memory!!!");
    }
    for (i = 0; i < H->TableSize; i++) {
        H->TheLists[i] = malloc(sizeof (struct ListNode));
        if (H->TheLists[i] == NULL)
            FatalError("Out of memory!!!");
        else
            H->TheLists[i]->Next = NULL;
    }

    return H;
}

const Position Find(const ElementType Key, const HashTable H, const char type[]) {
    Position P = NULL;
    List L;

    if (strcmp(type, "phone") == 0) {
        L = H->TheLists[Hash(Key->phone, H->TableSize)];
        P = L->Next;

        while (P != NULL && strcmp(P->Element->phone, Key->phone) != 0) {
            P = P->Next;
        }
    } else if (strcmp(type, "name") == 0) {
        L = H->TheLists[Hash(Key->name, H->TableSize)];
        P = L->Next;

        while (P != NULL && strcmp(P->Element->name, Key->name) != 0) {
            P = P->Next;
        }
    }

    return P;
}

void Insert(const ElementType Key, HashTable H, const char type[]) {
    Position Pos, NewCell;
    List L;

    Pos = Find(Key, H, type);
    if (Pos == NULL) {
        NewCell = malloc(sizeof (struct ListNode));
        if (NewCell == NULL) {
            FatalError("Out of memory!!!");
        } else {

            if (strcmp(type, "phone") == 0) {
                L = H->TheLists[Hash(Key->phone, H->TableSize)];

            } else if (strcmp(type, "name") == 0) {
                L = H->TheLists[Hash(Key->name, H->TableSize)];

            } else {
                L = NULL;
                free(NewCell);
                Error("Type Error");
            }

            if (L != NULL) {
                NewCell->Next = L->Next;
                NewCell->Element = Key;
                L->Next = NewCell;
            }

        }

    }

}

void DestroyTable(HashTable H) {
    Position P = NULL,tmp = NULL;
    List L;

    for (int i = 0; i < H->TableSize; i++) {
        L = H->TheLists[i];
        P = L->Next;

        while (P != NULL) {
            tmp = P;
            P = P->Next;
            free(tmp->Element);
            
            tmp->Element = NULL;
            tmp->Next = NULL;
            
            free(tmp);
        }
        
        free(L);
        H->TheLists[i] = NULL;
    }
    
    H->TheLists = NULL;
}