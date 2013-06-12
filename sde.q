\l rmath.q

/ Initial conditions
t0:0
T:2
N:20
dt:(T-t0)%N
x0:10

euler:{[f;g]({(f[theta;x]*dt)+(g[theta;x]*sqrt[dt])}\)[N;x0]}

/ Ornstein-Unhelbeck
/ dX(t) = (Theta_1 - Theta_2*X(t))dt + Theta_3*dW(t)
theta:0 5 3.5
f:{[x;y]x[0]-x[1]*y}
g:{[x;y]x[2]*(rnorm[1] 0)}
euler[f;g]

/ Cox-Ingersoll-Ross
/ dX(t) = (Theta_1 - Theta_2*X(t))dt + Theta_3*sqrt(X(t))*dW(t)
theta:6 3 2
g:{[x;y]x[2]*sqrt[y]}
euler[f;g]

/ Geometric Brownian Motion
/ dX(t) = Theta_1*X(t)*dt + Theta_2*X(t)*dW(t)
theta:1 .8
f:{[x;y]x[0]*y}
g:{[x;y]x[1]*y}



