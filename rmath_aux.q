/ wrappers for rmath functionality

/ rnorm: generate n random variates ~N(0,1) - for convenience only
rnorm:{[n] rnn[n;`float$0;`float$1]}

/ norm: generate a random variate ~N(mu,sigma)
norm:{[n;mu;sigma] rnn[n;`float$mu;`float$sigma]}

/ dnorm: normal density at x given ~N(mu,sigma)
dnorm:{[x;mu;sigma] dn[`float$x;`float$mu;`float$sigma]}

/ pnorm: distribution function at x given ~N(mu,sigma)
pnorm:{[x;mu;sigma] pn[`float$x;`float$mu;`float$sigma]}

/ qnorm: quantile function 
qnorm: {[x;mu;sigma] qn[`float$x;`float$mu;`float$sigma]}

/ runif: uniform random variates [min,max]
runif:{[n;a;b] ru[`int$n;`float$a;`float$b]}

/ rgamma: random gamma variates with shape and scale
rgamma:{[n;shape;scale] rg[`int$n; `float$shape; `float$scale]}

/ rbeta: random beta variates with shape parameters a and b
rbeta:{[n;a;b] rb[`int$n; `float$a; `float$b]}

/rms: root mean squared deviation
rms:{sqrt sum (x xexp 2) % (count x)}

/cv: coefficient of variation
cv: {[x] rms[x] % avg x }

/ scale: return x-mean(x)/sd(x) (note R uses x-mean(x)/rms(x))
scale:{(x-avg x)%dev x}

/ sigmoid function: f(x)->[0,1]
sigmoid:{1%(1+exp[neg x])}

/ tanh function: f(x)->[-1,1]
tanh:{(exp[x]-exp[neg x])%(exp[x]+exp[neg x])}

/ minmax scale function: f(x)->[0,1]
minmax:{(x-min[x])%(max[x]-min[x]) }

/ table: frequency table by symbol
table:{[x;y] f:{[s]count each group s}; asc ?[y;();();(f; x)]}

/ pvar: population variance a la R's var()
pvar:{(count[x]%(count[x]-1))*var x}

/ diag: diagonal matrix generation (identity by default)
diag:{i:til x*x;"i" $ (x;x)#raze 0=i mod (x+1)}

/ seqn: sequence [from,to] by step by
seqn:{[from;to;by] $[to < from;'`badrange;]; s:(from+til (to-from-1)); $[by=1;s;c:floor(to-from)%by;z:`float$from+0,sums c#by;:z]}

/ seq: sequence [from,to]
seq:{[from;to] seqn[from;to;1]}

/ range: min/max of vector
range:{(min x;max x)}

/ quantile: simple quantile using ecdf
quantile:{[x;p] xs:asc distinct x; n:count xs; 0.5*sum xs (floor n*p;1+floor n*p)}

/ summary: condensed summary stats (min/max/mean/median/.25 quantile/.75 quantile)
summary:{ `min`1q`median`mean`3q`max!(min x;quantile[x;.25];med x;avg x;quantile[x;.75];max x) }

/ histogram: simple bin count
hist:{[x;nbins] count each group (abs (-) . range x % nbins) xbar (asc x) }

