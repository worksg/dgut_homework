//������Ŀ�ھ��⣺˫�˶��еĲ���

/*
1.����������

˫�˶��У�˫�˶���Ҳ��һ�����ƴ�ȡλ�õ�˳���ȡ�ṹ���� 3 �ַ�ʽ��

�� ���������˽��Ӻͳ��ӵ�˫�˶��С��ɿ�����ջ������һ�������ջ������ջ��ջ��ָ�����������졣(����ջ���)
�� ����һ�˲��룬����������ɾ����˫�˶��С��ɿ�����ջ�׺Ͷ�β����һ���ջ���ӻ�ͣ�ջ�����Բ����ɾ�������׿���ɾ����(ջ���ӻ��)
�� �������˲��룬��ֻ����һ��ɾ����˫�˶��С��ɿ�����ջ�׺Ͷ�������һ���ջ���ӻ�ͣ�ջ�����Բ����ɾ������β���Բ��롣(ջ���ӻ��)


2.ʵ��Ҫ��

���ò���ͷ����˫�������ʾ˫�˶��У�front �� rear �ֱ���ָ����ס���β��ָ�룬���дʵ��˫�˶��в����ĺ�����
��  д���ֱ������ front �˺� rear �˽�����ӡ����Ӳ����� 4 ��������
��  д��ֻ���� front �˳��ӵ����� rear �˽�����ӡ����Ӳ����� 3 ��������
��  д��ֻ���� rear ����ӵ����� front �˽�����ӡ����Ӳ����� 3 ��������

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
