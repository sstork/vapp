// -*- c-basic-offset : 4 -*-

#include <stdlib.h>
#include <pthread.h>

#include <iostream>

using namespace std;


typedef struct {
    pthread_mutex_t lock;
    int value;
} counter_t;

int main (void) {
    pthread_mutex_t lock1, lock2;
    pthread_mutex_init(lock1);
    pthread_mutex_init(lock2);

    int *a = (int*)malloc(sizeof(int));
    int *b = (int*)malloc(sizeof(int));
    int *c = (int*)malloc(sizeof(int));
    int *d = (int*)malloc(sizeof(int));

    cout << "a: " << a << endl;
    cout << "b: " << b << endl;
    cout << "c: " << c << endl;
    cout << "d: " << c << endl;


    pthread_mutex_lock(lock1);
    a++;
    b++;
    pthread_mutex_lock(lock2);
    a++;
    b++;
    c++;
    pthread_mutex_unlock(lock1);
    a++;
    c++;
    pthread_mutex_unlock(lock2);

    free(a);
    free(c);
    free(d);

    return 0;
}
