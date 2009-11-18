all:
	${MAKE} -C tool
	${MAKE} -C tool2
	${MAKE} -C libVAPPControl
	${MAKE} -C libVAPPReplay
	${MAKE} -C examples
	${MAKE} -C analysis
	${MAKE} -C analysis2

clean:
	${MAKE} -C tool clean 
	${MAKE} -C tool2 clean 
	${MAKE} -C libVAPPControl clean
	${MAKE} -C libVAPPReplay clean
	${MAKE} -C examples clean
	${MAKE} -C analysis clean
	${MAKE} -C analysis2 clean

