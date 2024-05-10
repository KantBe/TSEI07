function h=Ex13cLP()
%h=Ex13cLP() gives the impulse response h of the 50th-order
%Type I filter in Exercise 13c using linear programming

wcT=0.3*pi;
wsT=0.4*pi;
dc=0.02;
ds=0.01;
t=1;
N=50;
M=N/2+1;
m=1:M;

Kp=100;
Ks=200;
w1T=linspace(0,wcT,Kp);
w2T=linspace(wsT,pi,Ks);
D1=ones(1,Kp);
D2=zeros(1,Ks);
W=[ones(1,Ks)/ds];
efix=ones(1,Kp)*dc;
A=[trigMat(t,m,w1T) zeros(1,Kp)'];
A=[A' [-trigMat(t,m,w1T) zeros(1,Kp)']']';
A=[A' [trigMat(t,m,w2T) -1./W']']';
A=[A' [-trigMat(t,m,w2T) -1./W']']';
b=[D1+efix -D1+efix D2 -D2]';
c=[zeros(1,M) 1]';
x=linprog(c,A,b);
h=[0.5*fliplr(x(2:M)') x(1) 0.5*x(2:M)'];
