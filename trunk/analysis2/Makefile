CC=$(CXX)
CXXFLAGS=-Wall -g  -pthread -I.


all: checker

checker: checker.o Analysis.o -lsqlite3

clean:
	rm -f checker *.o
