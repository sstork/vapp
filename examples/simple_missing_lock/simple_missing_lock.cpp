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

    cout << "thread: counter = " << cnt->value << endl;

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
    counter_t *cnt2 = new_counter();

    pthread_create(&t, NULL, run, cnt);

    pthread_mutex_lock(&cnt2->lock);
    cnt->value++;
    pthread_mutex_unlock(&cnt2->lock);

    pthread_join(t, NULL);

    cout << "counter = " << cnt->value << endl;

    free(cnt);

    return 0;
}
