// -*- c-basic-offset : 4 -*-
/*
 * Copyright (c) 2009, Anthony Gitter, Sven Stork
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <VAPPControl.h>

#define SIZE 32


void work()
{
    int *buffer;
    int value = 1;
    int i = 0;

    buffer = (int*)malloc(SIZE*SIZE*sizeof(int));

    printf("Working\n");

    for ( i = 0 ; i < SIZE*SIZE ; i++ ) {
        buffer[i] = value;
    }

    free(buffer);

}

int main(void){
    VAPPTraceOn(VAPP_MEM_ACCESS | VAPP_FN_CALL | VAPP_ALLOC_FREE);

    pthread_t thread;

    // Create a new thread and have it do some work
	pthread_create(&thread, NULL, work, NULL);

    // Have the main thread do some work concurrently
    work();

    VAPPTraceOff(VAPP_MEM_ACCESS | VAPP_FN_CALL | VAPP_ALLOC_FREE);

	return 0;
}
