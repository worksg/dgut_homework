//基础题目第九题：双端队列的操作

/*
1.问题描述：

双端队列：双端队列也是一种限制存取位置的顺序存取结构，有 3 种方式：

① 允许在两端进队和出队的双端队列。可看成是栈底连在一起的两个栈，两个栈的栈顶指针向两端延伸。(两个栈混和)
② 允许一端插入，但允许两端删除的双端队列。可看成是栈底和队尾连在一起的栈、队混和，栈顶可以插入和删除、队首可以删除。(栈、队混和)
③ 允许两端插入，但只允许一端删除的双端队列。可看成是栈底和队首连在一起的栈、队混和，栈顶可以插入和删除、队尾可以插入。(栈、队混和)


2.实现要求：

设用不带头结点的双向链表表示双端队列，front 和 rear 分别是指向队首、队尾的指针，请编写实现双端队列操作的函数。
⑴  写出分别可以在 front 端和 rear 端进行入队、出队操作的 4 个函数。
⑵  写出只能在 front 端出队但能在 rear 端进行入队、出队操作的 3 个函数。
⑶  写出只能在 rear 端入队但能在 front 端进行入队、出队操作的 3 个函数。

*/

#include<stdio.h>
#include<stdlib.h>

#define True 1 
#define False 0
#define boolean int

typedef int ElemType;

typedef struct DuLNode {
	ElemType data;
	struct DuLNode *prior, *next;
} DuLNode, *DuLinkList;


typedef void(*func)(ElemType, ElemType *);

void assign(ElemType raw_data,ElemType *data) {
	*data = raw_data;
}

boolean dequeue_front(DuLinkList *head, ElemType * data, func my_assign) {
	if (*head != NULL) {

		my_assign((*head)->data, data);

		(*head)->next->prior = NULL;
		(*head) = (*head)->next;
		return True;
	}
	else{
		return False;
	}
}

boolean dequeue_rear(DuLinkList *head, ElemType * data, func my_assign) {
	if (*head != NULL) {
		DuLinkList head_bak = *head;
		while (head_bak->next != NULL) {
			head_bak = head_bak->next;
		}
		//ElemType data = head_bak->data;
		my_assign(head_bak->data, data);
		if (head_bak->prior != NULL) {
			head_bak->prior->next = NULL;
		}
		else{
			(*head) = NULL;
		}
		return True;
	}
	else{
		return False;
	}
}

void queue_front(DuLinkList *head, ElemType data) {
	if (*head == NULL) {
		DuLinkList new_head = (DuLinkList)malloc(sizeof(DuLNode));
		new_head->data = data;
		new_head->prior = NULL;
		new_head->next = NULL;
		*head = new_head;
	}
	else {
		DuLinkList new_node = (DuLinkList)malloc(sizeof(DuLNode));
		new_node->data = data;
		new_node->prior = NULL;
		(*head)->prior = new_node;
		new_node->next = (*head);
		*head = new_node;
	}
}

void queue_rear(DuLinkList *head, ElemType data) {
	if (*head != NULL) {
		DuLinkList head_bak = *head;
		while (head_bak->next != NULL) {
			head_bak = head_bak->next;
		}
		DuLinkList new_rear = (DuLinkList)malloc(sizeof(DuLNode));
		new_rear->data = data;
		new_rear->prior = head_bak;
		head_bak->next = new_rear;
		new_rear->next = NULL;
	}
	else{
		queue_front(head, data);
	}
}

int main() {
	DuLinkList head = NULL;

	queue_front(&head, 6);
	queue_front(&head, 7);
	queue_front(&head, 8);
	queue_rear(&head, 5);
	ElemType *data = (ElemType *)malloc(sizeof(ElemType));
	//void(*myassign)(ElemType, ElemType *) = assign;

	if (dequeue_front(&head, data, assign)) {
		printf("%d", *data);
	}

	if (dequeue_rear( &head, data, assign)) {
		printf("%d", *data);
	}

	if (dequeue_rear( &head, data, assign)) {
		printf("%d", *data);
	}

	return 0;
}
