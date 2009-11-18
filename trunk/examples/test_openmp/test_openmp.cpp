// -*- c-basic-offset : 4 -*-

#include <stdlib.h>
#include <omp.h>


int main(void) 
{
    int *result = (int*)malloc(sizeof(int));
    int value = 3;
    
#pragma omp parallel for 
    for ( int i = 0 ; i < 10  ; i++ )  {
        if ( i % value == 0) {
#pragma omp critical 
            {
                if ( *result < i ) {
                    *result = i;
                }
            }
        }
    }
}
