// -*- c-basic-offset : 4 -*-

#include <stdlib.h>
#include <pthread.h>

#include <iostream>

using namespace std;


typedef struct {
    pthread_mutex_t lock;
    int value;
} counter_t;


void* run(void *v) {
    counter_t *cnt = (counter_t*)v;
    
    pthread_mutex_lock(&cnt->lock);
    cnt->value++;
    pthread_mutex_unlock(&cnt->lock);

    return NULL;
}


counter_t* new_counter() {
    counter_t *cnt = (counter_t*)malloc(sizeof(counter_t));
    pthread_mutex_init(&cnt->lock, NULL);
    cnt->value = 0;
    return cnt;
}


int main (void) {
    pthread_t t;
    counter_t *cnt = new_counter();

    pthread_create(&t, NULL, run, cnt);

    cnt->value++;

    pthread_join(t, NULL);

    cout << "counter = " << cnt->value << endl;

    return 0;
}