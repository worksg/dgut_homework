/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: Sg
 * reference link: http://www.erg.abdn.ac.uk/users/gorry/course/lan-pages/csma-cd.html
 * Created on April 15, 2018, 10:57 PM
 */
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <time.h>

#define idle_time 0.096
#define trip_time 0.256
#define twice_trip_time 0.512

unsigned int x = 0;
unsigned int run_time = 0;
pthread_mutex_t mutex;

int get() {
    return x;
}

void use() {
    x++;
}

void release() {
    x--;
}

int min(int occurred_time) {
    return occurred_time >= 10 ? 10 : occurred_time;
}

int get_retransmission_time(int occurred_time) {
    int num_min = min(occurred_time);
    int max_range = pow(2, num_min);
    return rand() % max_range;
}

void node(char *p) {

    int seq1, seq2, i = 0;
    int occurred_time = 0;
    int multiple = 0;

    while (i < run_time) {
        seq1 = get();
        //idle detect, twice complete round trip propagation time
        sleep(idle_time);
        //        seq2 = get();
        if (!(seq1 + get())) {


            seq1 = get();

            pthread_mutex_lock(&mutex); // 给互斥体变量加锁
            use(); //using share hub
            pthread_mutex_unlock(&mutex); // 给互斥体变量解除锁 

            ++i;
            //            printf("station %s transmitting frame %d \n", p, ++i);

            sleep(0.256); //transmitting time


            //            seq2 = get();

            //someone using share hub in the transmitting time


            if (get() == 1 && !seq1) {

                //                printf("station %s complete frame %d \n", p, i);
                occurred_time = 0;

            } else {

                if (++occurred_time > 10) {
                    printf("station %s drop frame %d, occurred time: %d \n",
                            p, i, occurred_time);
                    occurred_time = 0;
                } else {
                    multiple = get_retransmission_time(occurred_time);
                    printf(
                            "station %s collision occurred frame %d, occurred time: %d, multiple: %d \n",
                            p, i--, occurred_time, multiple);
                    //                sleep(0.048);
                    sleep(multiple * twice_trip_time); // Retransmission Back-Off
                }
            }


            //            while (1)
            //                if (get() == 1) {
            //                    break;
            //                } else if (get() == 0) {
            //                    printf("[0] station %s transmitting frame %d \n", p, i + 1);
            //                    break;
            //                } else if (get() == 2) {
            //                    printf("[2] station %s transmitting frame %d \n", p, i + 1);
            //                    break;
            //                } else {
            //                    printf("[%d] station %s transmitting frame %d \n", get(), p, i + 1);
            //                    break;
            //                }

            pthread_mutex_lock(&mutex); // 给互斥体变量加锁
            release();
            pthread_mutex_unlock(&mutex); // 给互斥体变量解除锁 

        }
    }
}

/*
 * 
 */
int main(int argc, char** argv) {

    srand(time(NULL));

    //    printf("%d , %s", argc, *argv);
    if (argc == 2 && atoi(argv[1]) > 0) {
        run_time = atoi(argv[1]);

        pthread_t t1, t2;

        pthread_mutex_init(&mutex, NULL); //按缺省的属性初始化互斥体变量mutex

        pthread_create(&t1, 0, (void *) node, "PC-[A]");
        pthread_create(&t2, 0, (void *) node, "PC-[B]");

        pthread_join(t1, NULL);
        pthread_join(t2, NULL);
    }

    return (EXIT_SUCCESS);
}


