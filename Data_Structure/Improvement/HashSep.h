#ifndef _HashSep_H

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
void FatalError(const char *);
void Error(const char *);

typedef unsigned int Index;

#endif // _HashSep_H