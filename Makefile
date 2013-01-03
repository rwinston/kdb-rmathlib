rmath.so:
	gcc -Wall -bundle -undefined dynamic_lookup -m32 -I /Users/rorywinston/sandbox/R/src/include -I /Users/rorywinston/sandbox/kdb rmath.c -L /Users/rorywinston/sandbox/R/src/nmath/standalone -o rmath.so -lm -lRmath

rmath.q: rmath.so
	sh process.sh > rmath.q

clean:
	rm -f rmath.q
	rm -f rmath.so

all: rmath.so rmath.q

