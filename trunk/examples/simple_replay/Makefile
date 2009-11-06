CXXFLAGS=-Wall -g -O0  -I../../libVAPPReplay
LDFLAGS=-L ../../libVAPPReplay/ 

all: simple_replay

simple_replay: ../../libVAPPReplay/libVAPPReplay.a -lsqlite3

clean:
	rm -f simple_replay
