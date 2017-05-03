.PHONY: ab

APR_INC_PATH=./apr/apr-1.5.2/include
APR_UTIL_INC_PATH=./apr/apr-util-1.5.4/include
APR_LIB_PATH=./apr/apr-1.5.2/.libs/libapr-1.a
APR_UTIL_LIB_PATH=./apr/apr-util-1.5.4/.libs/libaprutil-1.a

all: libapr ab

libapr:
	make -C ./apr/ all
	

apr-skeleton: apr-skeleton.c 
	gcc apr-skeleton.c -o apr-skeleton -I${APR_UTIL_INC_PATH} -I${APR_INC_PATH} -L${APR_LIB_PATH} -static -lapr-1 -Wl,-Bdynamic -lpthread -lc -D_REENTRANT -D_GNU_SOURCE -D_LARGEFILE64_SOURCE
#	gcc apr-skeleton.c -o apr-skeleton -I./apr/aprutil-build/include/apr-1/ -I./apr/apr-build/include/apr-1/ -L./apr/apr-build/lib/ -lapr-1 -lpthread -D_REENTRANT -D_GNU_SOURCE -D_LARGEFILE64_SOURCE

ab: ab.c ap_release.h
	gcc ab.c ${APR_LIB_PATH} ${APR_UTIL_LIB_PATH} ap_release.h -o ab -I${APR_UTIL_INC_PATH} -I${APR_INC_PATH} -lpthread -lm -D_REENTRANT -D_GNU_SOURCE -D_LARGEFILE64_SOURCE
#	gcc ab.c ap_release.h -o ab -I./apr/aprutil-build/include/apr-1/ -I./apr/apr-build/include/apr-1/ -L./apr/apr-build/lib/ -L./apr/aprutil-build/lib/ -lapr-1 -laprutil-1 -lm  -lpthread -D_REENTRANT -D_GNU_SOURCE -D_LARGEFILE64_SOURCE



clean:
	make -C ./apr/ clean
	rm ab apr-skeleton
