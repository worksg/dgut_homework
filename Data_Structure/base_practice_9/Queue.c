#include"Queue.h"
#include<stdlib.h>


//队首出队
boolean dequeue_front(DuLinkList *head, ElemType * data, func my_assign) {

	DuLinkList tmp = NULL;

	if (*head != NULL) {

		my_assign((*head)->data, data); //提取数据

		if ((*head)->next != NULL)
			(*head)->next->prior = NULL;

		tmp = *head;
		(*head) = (*head)->next;

		free(tmp);
		tmp = NULL;

		return True;
	}
	else{
		return False;
	}
}

//队尾出队
boolean dequeue_rear(DuLinkList *head, ElemType * data, func my_assign) {

	DuLinkList tmp = NULL;

	if (*head != NULL) {
		DuLinkList head_bak = *head;
		while (head_bak->next != NULL) {
			head_bak = head_bak->next;
		}
		//ElemType data = head_bak->data;
		my_assign(head_bak->data, data);

		tmp = head_bak;

		if (head_bak->prior != NULL) {
			head_bak->prior->next = NULL;
		}
		else{
			(*head) = NULL;
		}

		free(tmp);
		tmp = NULL;

		return True;
	}
	else{
		return False;
	}
}

//队首入队
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

//队尾入队
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

