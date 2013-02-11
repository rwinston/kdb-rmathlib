/**
 * rmath.c - kdb+/q bridge to functions in Rmathlib 
 * Rory Winston <rory@theresearchkitchen.com>
 */

#include "rmath.h"

/**
 * Normal variates
 */
K rn(K mu, K sigma) {
    double mean = mu->f;
    double dev = sigma->f;
    return kf(rnorm(mean,dev));
}

/**
 * rnorm: Vectorized version
 * Should theoretically be more efficient to compute multiple 
 * values here rather than looping in kdb
 */
K rnn(K n, K mu, K sigma) {
    int i,count = n->i;
    K ret = ktn(KF, count);
    for (i = 0; i < count; ++i)
        kF(ret)[i] = rnorm(mu->f, sigma->f);
    return ret;
}

/**
 * pnorm: Probability distribution P[X<=x]
 */
K pn(K x, K mu, K sigma) {
    double fx = x->f;
    double mean = mu->f;
    double dev = sigma->f;
    double p = pnorm5(fx, mean, dev, TRUE, FALSE);
    return kf(p);
}

/**
 * qnorm: Quantile function
 */
K qn(K x, K mu, K sigma) {
    double fx = x->f;
    double mean = mu->f;
    double dev = sigma->f;
    double q = qnorm5(fx, mean, dev, TRUE, FALSE);
    return kf(q);
}

/**
 * dnorm: Compute density of normal distribution at x 
 * with a N(mu, sigma) distribution fit
 */
K dn(K x, K mu, K sigma) {
    double px = x->f;
    double mean = mu->f;
    double sd = sigma->f;
    double ret = dnorm(px, mean, sd, FALSE);
    return kf(ret);
}

/**
 * Random uniform value between a and b
 */
K ru(K n, K a, K b) {
    int i, count=n->i;  
    double lower = a->f; 
    double upper = b->f;
    K ret = ktn(KF, count);
    for (i = 0; i < count; ++i)
        kF(ret)[i] = runif(lower, upper);

    return ret;
}

/**
 * Random gamma variates with specified shape and scale
 */
K rg(K n, K sh, K sc) {
    int i, count=n->i;
    double shape = sh->f;
    double scale = sc->f;
    K ret = ktn(KF, count);
    for (i = 0; i < count; ++i) {
        kF(ret)[i] = rgamma(shape,scale);
    }
    return ret;
}

/**
 * Random beta variates with shape parameters a and b 
 */
K rb(K n, K a, K b) {
    int i, count=n->i;
    double shape = a->f;
    double shape2 = b->f;
    K ret = ktn(KF, count);
    for (i = 0; i < count; ++i) {
        kF(ret)[i] = rbeta(shape,shape2);
    }
    return ret;
}


/**
 * Set seeds for Marsaglia multicarry RNG
 */
K sseed(K seed1, K seed2) {
    set_seed((unsigned int)seed1->i, (unsigned int)seed2->i);
    return (K)0;
}

/**
 * Get RNG seeds
 */
K gseed() {
    unsigned int seed1, seed2;
    get_seed(&seed1, &seed2);
    K ret = ktn(KI, 2);
    kI(ret)[0] = seed1;
    kI(ret)[1] = seed2;
    return ret;
}

/**
 * Binomial coefficients (n-choose-k)
 */
K nchoosek(K n, K k) {
    double fn = (double)n->i;
    double fk = (double)k->i;
    double ret = choose(fn, fk);
    return kf(ret); 
}
