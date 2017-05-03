APR=apr-1.5.2
APRUTIL=apr-util-1.5.4

all: buildapr

buildapr:
	cp Makefile_apr $(APR)
	make -C $(APR) -f Makefile_apr	
	cp Makefile_aprutil $(APRUTIL)
	make -C $(APRUTIL) -f Makefile_aprutil

clean:
	make -C ${APR} clean
	make -C ${APRUTIL} clean
