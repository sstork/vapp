CXXFLAGS=-fPIC -Wall -g -I.

all:libVAPPReplay.a

libVAPPReplay.a: VAPPReplay.o
	$(AR) -r libVAPPReplay.a VAPPReplay.o
	ranlib libVAPPReplay.a

clean:
	rm -f libVAPPReplay.a *.o
