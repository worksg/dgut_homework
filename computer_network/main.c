/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: root
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


int x = 0;

double trip_time;

double twice_trip_time;

int get() {
    return x;
}

void use() {
    x++;
}

void release() {
    x = 0;
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

    while (1) {
        seq1 = get();
        //idle detect, twice complete round trip propagation time
        sleep(twice_trip_time);
        seq2 = get();
        if (!(seq1 + seq2)) {

            use(); //using share hub

            seq1 = get();
            //++i;
            printf("station %s transmitting frame %d \n", p, ++i);
            sleep(0.05 * (rand() % 4)); //transmitting time
            seq2 = get();

            //someone using share hub in the transmitting time
            if (seq1 == 1 && seq2 == 1) {
                release();
                printf("station %s complete frame %d \n", p, i);
                occurred_time = 0;
                sleep(0.1 * (rand() % 8));

            } else {
                release();
                if (++occurred_time == 16) {
                    printf("station %s drop frame %d, occurred time: %d \n",
                            p, i, occurred_time);
                } else {
                    int multiple = get_retransmission_time(occurred_time);
                    printf(
                            "station %s collision occurred frame %d, occurred time: %d, multiple: %d \n",
                            p, i--, occurred_time, multiple);
                    sleep(multiple * twice_trip_time); // Retransmission Back-Off
                }
            }
        }
    }

}

/*
 * 
 */
int main(int argc, char** argv) {

    srand(time(NULL));

    trip_time = 0.02;
    twice_trip_time = trip_time * 2;
    
    pthread_t t1, t2, t3;

    pthread_create(&t1, 0, (void *) node, "PC-1");
    pthread_create(&t2, 0, (void *) node, "PC-2");
    pthread_create(&t3, 0, (void *) node, "PC-3");

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);

    return (EXIT_SUCCESS);
}

