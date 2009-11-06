CFLAGS=-fPIC -Wall -g

all:libVAPPControl.a

libVAPPControl.a: VAPPControl.o
	$(AR) -r libVAPPControl.a VAPPControl.o
	ranlib libVAPPControl.a

clean:
	rm -f libVAPPControl.a *.o
