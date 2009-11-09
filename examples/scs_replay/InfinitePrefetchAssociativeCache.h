// -*- Mode : C++ ; c-basic-offset : 4 -*-
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

#ifndef INFINITE_PREFETCH_ASSOCIATIVE_CACHE_H
#define INFINITE_PREFETCH_ASSOCIATIVE_CACHE_H

#include "Cache.h"

class InfinitePrefetchAssociativeCache : public Cache
{
 protected:
    CacheLine **cacheSet;

 public:
    InfinitePrefetchAssociativeCache(int cacheSize,
                                     int lineSize,
                                     int cacheMissLatency,
                                     int memoryRepeatRate,
                                     int associativity,
                                     int prefefetch);
    virtual ~InfinitePrefetchAssociativeCache();

    virtual CacheStats read(long addr, int size);
    virtual CacheStats write(long addr, int size);

    virtual long getIndex(long addr);

 protected:
    CacheStats accessPrefetch(long addr, int size, bool write);
    CacheStats access(long addr, int size, bool write);
};

#endif // INFINITE_PREFETCH_ASSOCIATIVE_CACHE_H
