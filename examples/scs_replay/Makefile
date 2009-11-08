CC=g++
CXXFLAGS=-Wall -I../../libVAPPReplay -I. -g
LDFLAGS=-L ../../libVAPPReplay/ 
SOURCES=AssociativeCache.cpp 				\
		Cache.cpp							\
		FinitePrefetchAssociativeCache.cpp 	\
		Global.cpp							\
		InfinitePrefetchAssociativeCache.cpp\
		Part.cpp							\
		Profiler.cpp						\
		scs_replay.cpp
OBJECTS=$(SOURCES:.cpp=.o)

all: scs_replay 

scs_replay:$(OBJECTS) ../../libVAPPReplay/libVAPPReplay.a -lsqlite3

clean:
	rm -f scs_replay $(OBJECTS)