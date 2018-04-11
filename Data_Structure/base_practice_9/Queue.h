#ifndef _DULINK_H

#define True 1 
#define False 0
#define boolean int

typedef int ElemType;

typedef struct DuLNode {
	ElemType data;
	struct DuLNode *prior, *next;
} DuLNode, *DuLinkList;


typedef void(*func)(ElemType, ElemType *);

boolean dequeue_front(DuLinkList *head, ElemType * data, func my_assign);
boolean dequeue_rear(DuLinkList *head, ElemType * data, func my_assign);
void queue_front(DuLinkList *head, ElemType data);
void queue_rear(DuLinkList *head, ElemType data);

void first_test(int);
void second_test(int);
void third_test(int);

#endif