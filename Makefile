CFLAGS = -Wall -bundle -undefined dynamic_lookup -arch i386 -m32 -I/Users/rorywinston/sandbox/R/src/include -I/Users/rorywinston/sandbox/kdb -L/Users/rorywinston/sandbox/R/src/nmath/standalone 
LDFLAGS = -lm -lrmath

rmath.so:
	gcc ${CFLAGS} rmath.c -o rmath.so -lm -lRmath ${LDFLAGS}

rmath.q: rmath.so
	sh process.sh > rmath.q

clean:
	rm -f rmath.q
	rm -f rmath.so

all: rmath.so rmath.q

