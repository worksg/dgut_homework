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
⑶  写出只能在 rear 端出队但能在 front 端进行入队、出队操作的 3 个函数。

*/
#include"Queue.h"
#include<stdio.h>

int main() {

	printf("TEST - UNIT 1\n");
	first_test(32);

	printf("TEST - UNIT 2\n");
	second_test(64);

	printf("TEST - UNIT 3\n");
	third_test(128);

	return 0;
}
