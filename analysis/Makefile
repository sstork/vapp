CC=$(CXX)
CXXFLAGS=-Wall -g -O2 -pthread -I.


all: checker

checker: checker.o Analysis.o -lsqlite3

clean:
	rm -f checker *.o
