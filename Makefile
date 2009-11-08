all:
	${MAKE} -C src
	${MAKE} -C libVAPPControl
	${MAKE} -C libVAPPReplay
	${MAKE} -C examples


clean:
	${MAKE} -C src clean 
	${MAKE} -C libVAPPControl clean
	${MAKE} -C libVAPPReplay clean
	${MAKE} -C examples clean

