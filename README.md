Q/RMathLib interface
====================

This is a simple interface between the standalone R mathlib and kdb+/q.

The source contains the following:

- rmath.h/rmath.c - source files (rmath.h contains exported function definitions)
- rmath_aux.q - extra Q definitions and helpers
- process.sh - generates Q import lib scripts
- Makefіle - simple makefile


Sample
=======

In a q session:

<pre>
 q) \l rmath.q
 q) x:rnorm 1000     / create 1000 normal variates
 q) summary x        / simple statistical summary of x
 q) hist[x;10]       / show histogram (bin count) with 10 bins
 q) y:scale x        / x = (x - mean(x))/sd(x)
 q) quantile[x;.5]   / calculate the 50% quantile
 q) pnorm[0;1.5;1.5] / cdf value for 0 for a N(1.5,1.5) distribution
 q) dnorm[0;1.5;1.5] / normal density at 0 for N(1.5;1.5) distribution
</pre>

See

http://www.theresearchkitchen.com/archives/835

http://www.theresearchkitchen.com/archives/847

http://www.theresearchkitchen.com/archives/896

for more details

