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
#include <string.h>
#include "HashSep.h"
#include "Tools.h"
#include <unistd.h>


/*
 * 
 */
int main(int argc, char** argv) {
    HashTable H_name = InitializeTable(64);
    HashTable H_phone = InitializeTable(64);

    ElementType find_elem = NULL;

    int n = -1;
    char str[30];
    char num[3]; //设置2个会导致换行符无法读取而跳转到下一个fgets!!

    read_file(H_name, H_phone);

    while (n) {
        system("clear");

        printf("*** menu *** \n");
        printf("*** 1. query by name \n");
        printf("*** 2. query by phone \n");
        printf("*** 3. exit \n");

        fgets(num, sizeof (num), stdin);
        if (strlen(num) > 1) {
            if (num[strlen(num) - 1] != '\n')
                while (getchar() != '\n')continue;
            num[strlen(num) - 1] = '\0';
        }
        
        n = atoi(num);

        fflush(stdin);

        switch (n) {
            case 1:
                printf("input name:");

                fgets(str, NAME_LENGTH, stdin);
                if (strlen(str) > 1) {
                    if (str[strlen(str) - 1] != '\n')
                        while (getchar() != '\n')continue;
                    str[strlen(str) - 1] = '\0';
                }


                if (str != NULL)
                    find_elem = query_name(str, H_name);

                printf("*** query by name \n");
                if (find_elem != NULL) {
                    printf("*** name: %s \n", find_elem->name);
                    printf("*** phone: %s \n", find_elem->phone);
                    printf("*** address: %s \n", find_elem->address);
                    find_elem = NULL;


                } else {
                    printf("*** NULL \n");
                }

                while (getchar() != '\n')continue;
                break;
            case 2:
                printf("input phone:");

                fgets(str, PHONE_LENGTH, stdin);
                if (strlen(str) > 1) {
                    if (str[strlen(str) - 1] != '\n')
                        while (getchar() != '\n')continue;
                    str[strlen(str) - 1] = '\0';
                }

                if (str != NULL)
                    find_elem = query_phone(str, H_phone);

                printf("*** query by phone \n");
                if (find_elem != NULL) {
                    printf("*** name: %s \n", find_elem->name);
                    printf("*** phone: %s \n", find_elem->phone);
                    printf("*** address: %s \n", find_elem->address);
                    find_elem = NULL;

                } else {
                    printf("*** NULL \n");
                }

                while (getchar() != '\n')continue;
                break;
            case 3:
                n = 0;
                break;
            default:
                printf("re-enter please \n");
                n = -1;
                sleep(1);
                break;
        }
    }

    DestroyTable(H_name);
    DestroyTable(H_phone);

    return (EXIT_SUCCESS);
}

