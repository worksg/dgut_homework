/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
哈希表的设计与实现
1.问题描述 设计散列表实现电话号码查找系统。
2.基本要求
1)设每个记录有下列数据项：电话号码、用户姓名、地址；
2)从文件输入各记录，分别以电话号码和用户名为关键字建立散列表；（假设人名为中国人姓名的汉语拼音形式zhoukunxiao）
3)采用一定的方法解决冲突；（哈希函数可以用数字分析法和除留余数法构造，用线性探测再散列法或链地址法处理冲突）
4)查找并显示给定电话号码的记录；
5)查找并显示给定用户姓名的记录。
3.测试数据
取所在班级的40个同学记录。
4.选作内容
（1） 从课本上介绍的集中哈希函数构造方法中选出适用者并设计几个不同的哈希函数，比较他们的地址冲突率（可以用更大的记录集合作实验）。
（2） 研究这40个人名的特点，努力找一个哈希函数，使得对于不同的拼音姓名一定不发生地址冲突。
（3） 在哈希函数确定的前提下尝试各种不同处理冲突的方法，考察平均查找长度的变化和造好的哈希表中关键字的聚集性。
 */

/* 
 * File:   main.c
 * Author: root
 *
 * Created on April 14, 2018, 2:15 PM
 */


#include <stdio.h>
#include <stdlib.h>
#include "HashSep.h"
#include<string.h>

void _file_io(HashTable H_name_index, HashTable H_phone_index) {
    ElementType Key;

    FILE *ifp; //, *ofp;
    ifp = fopen("./in.list", "r");

    if (ifp == NULL) {
        fprintf(stderr, "Can't open input file in.list!\n");
        exit(1);
    }

    char name[30];
    char phone[20];
    char address[50];
    while (fscanf(ifp, "%s\t%s\t%s", name, phone, address) != EOF) {
        printf("%s %s %s\n", name, phone, address);
        Key = malloc(sizeof (struct ElementNode));
        if (Key == NULL) {
            FatalError("Out of memory!!!");
        } else {
            strncpy(Key->name, name, sizeof (name));
            strncpy(Key->phone, phone, sizeof (phone));
            strncpy(Key->address, address, sizeof (address));
        }

        Insert(Key, H_name_index, "name");
        Insert(Key, H_phone_index, "phone");
    }


    //    ofp = fopen("./out.list", "w");
    //
    //    if (ofp == NULL) {
    //        fprintf(stderr, "Can't open output file %s!\n",
    //                "./out.list");
    //        exit(1);
    //    }

}

const ElementType Query_phone(const char * Key, const HashTable H) {
    Position P = NULL;
    List L;

    L = H->TheLists[Hash(Key, H->TableSize)];
    P = L->Next;

    while (P != NULL && strcmp(P->Element->phone, Key) != 0) {
        P = P->Next;
    }
    
    if (P != NULL){
        return P->Element;
    }
    return NULL;
}

const ElementType Query_name(const char * Key, const HashTable H) {
    Position P = NULL;
    List L;

    L = H->TheLists[Hash(Key, H->TableSize)];
    P = L->Next;

    while (P != NULL && strcmp(P->Element->name, Key) != 0) {
        P = P->Next;
    }
    
    if (P != NULL){
        return P->Element;
    }
    return NULL;
}

/*
 * 
 */
int main(int argc, char** argv) {
    HashTable H_name = InitializeTable(64);
    HashTable H_phone = InitializeTable(64);

    _file_io(H_name, H_phone);

    const ElementType findname_elem = Query_name("zhoukunxiao9",H_name);
    const ElementType findphone_elem = Query_phone("137508",H_phone);
    
    DestroyTable(H_name);
    DestroyTable(H_phone);
    return (EXIT_SUCCESS);
}

