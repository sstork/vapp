// -*- c-basic-offset : 4 -*-

#include <stdlib.h>
#include <pthread.h>

#include <iostream>

using namespace std;

pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t lock2 = PTHREAD_MUTEX_INITIALIZER;


typedef struct {    
    int value;
} counter_t;


void* run(void *v) {
    counter_t *cnt = (counter_t*)v;
    
    pthread_mutex_lock(&lock2);
    cnt->value++;
    pthread_mutex_unlock(&lock2);
    
    return NULL;
}

counter_t* new_counter() {
    counter_t *cnt = (counter_t*)malloc(sizeof(counter_t));
    pthread_mutex_lock(&lock);
    cnt->value = 0;
    pthread_mutex_unlock(&lock);
    return cnt;
}

int main (void) {
    pthread_t t;
    counter_t *cnt = new_counter();
    
    pthread_create(&t, NULL, run, cnt);

    pthread_mutex_lock(&lock);
    cnt->value++;
    pthread_mutex_unlock(&lock);

    pthread_join(t, NULL);

    return 0;
}
