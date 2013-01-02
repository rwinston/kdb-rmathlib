/ wrappers for rmath functionality

/ rnorm: generate n random variates ~N(0,1)
rnorm:{[n] rnn[n;`float$0;`float$1]}

/ scale: return x-mean(x)/sd(x)
scale:{(x-avg x)%dev x}

/ table: frequency table by symbol
table:{[x;y] f:{[s]count each group s}; ?[y;();();(f; x)]}

/ pvar: population variance a la R's var()
pvar:{(count[x]%(count[x]-1))*var x}

/ diag: diagonal matrix generation (identity by default)
diag:{i:til x*x;"i" $ (x;x)#raze 0=i mod (x+1)}

/ seqn: sequence [from,to] by step by
seqn:{[from;to;by] $[to < from;'order;]; s:(from+til (to-from-1)); $[by=1;s;c:floor(to-from)%by;z:from+0,sums c#by;z]}

/ seq: sequence [from,to]
seq{[from;to] seqn[from;to;1]}


