#include<stdio.h>
#include<stdlib.h>
#include"Queue.h"

void assign(ElemType raw_data, ElemType *data) {
	*data = raw_data;
}

//ʵ�� Ҫ��һ ��������
void first_test(int range) {
	DuLinkList head = NULL;
	int i;

	//Ԫ�������
	printf("Ԫ����������ס���β\n");
	for (i = 0; i < range; i++)
	{
		printf("%d\t", i);
		if (i & 1)
			queue_front(&head, i);
		else
			queue_rear(&head, i);
	}
	putchar('\n');

	ElemType *data = (ElemType *)malloc(sizeof(ElemType));
	//void(*myassign)(ElemType, ElemType *) = assign;

	printf("Ԫ�����γ����ס���β\n");
	i = 0;
	while (True)
	if (i++ & 1)
	if (dequeue_rear(&head, data, assign))
		printf("%d\t", *data);
	else
		break;
	else
	if (dequeue_front(&head, data, assign))
		printf("%d\t", *data);
	else
		break;
	putchar('\n');
}

void second_test(int range){
	DuLinkList head = NULL;
	int i;

	//Ԫ�������
	printf("Ԫ��ֻ���β\n");
	for (i = 0; i < range; i++)
	{
		printf("%d\t", i);
		queue_rear(&head, i);
	}
	putchar('\n');

	ElemType *data = (ElemType *)malloc(sizeof(ElemType));
	//void(*myassign)(ElemType, ElemType *) = assign;

	printf("Ԫ�����γ����ס���β\n");
	i = 0;
	while (True)
	if (i++ & 1)
	if (dequeue_rear(&head, data, assign))
		printf("%d\t", *data);
	else
		break;
	else
	if (dequeue_front(&head, data, assign))
		printf("%d\t", *data);
	else
		break;
	putchar('\n');
}

void third_test(int range) {
	DuLinkList head = NULL;
	int i;

	//Ԫ�������
	printf("Ԫ��ֻ�����\n");
	for (i = 0; i < range; i++)
	{
		printf("%d\t", i);
		queue_front(&head, i);
	}
	putchar('\n');

	ElemType *data = (ElemType *)malloc(sizeof(ElemType));
	//void(*myassign)(ElemType, ElemType *) = assign;

	i = 0;
	printf("Ԫ�����γ����ס���β\n");
	while (True)
	if (i++ & 1)
	if (dequeue_rear(&head, data, assign))
		printf("%d\t", *data);
	else
		break;
	else
	if (dequeue_front(&head, data, assign))
		printf("%d\t", *data);
	else
		break;
	putchar('\n');
}