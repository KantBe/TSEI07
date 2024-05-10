% Requirements for the lowpass filter
% Filter 1
wdc=0.3;
wds=0.5;
Amax=0.1;
Amin=60;

T=1;
wc=(2/T)*tan(wdc/2);
ws=(2/T)*tan(wds/2);

% Filter 2
% wc=0.3;
% ws=0.5;
% Amax=0.01;
% Amin=80;

% Filter 3
% wc=0.45;
% ws=0.5;
% Amax=0.1;
% Amin=60;

% Synthesis of the Butterworth filter
[N,Wn]=buttord(wc,ws,Amax,Amin,'s');
[Z,P,G]=buttap(N);
epsilon=sqrt(10^(0.1*Amax)-1);
w0p=wc*epsilon^(-1/N);
P=P*w0p;
G=G*w0p^N;

% Synthesis of the Chebyshev-I filter
% [N,Wn]=cheb1ord(wc,ws,Amax,Amin,'s');
% [Z,P,G]=cheb1ap(N,Amax);
% P=P*wc;
% G=G*wc^N;

% Synthesis of the Chebyshev-II filter
% [N,Wn]=cheb2ord(wc,ws,Amax,Amin,'s');
% [Z,P,G]=cheb2ap(N,Amin);
% Z=Z*ws;
% P=P*ws;
% G=G*ws^(length(P)-length(Z));

% Synthesis of the Cauer filter
% [N,Wn]=ellipord(wc,ws,Amax,Amin,'s');
% [Z,P,G]=ellipap(N,Amax,Amin);
% Z=Z*wc;
% P=P*wc;
% G=G*wc^(length(P)-length(Z));

[Zd,Pd,Gd] = bilinear(Z,P,G,1);

wT = linspace(0,pi,5);
[N,D] = zp2tf(Z,P,G);
[H,wT] = freqz(N,D,wT);
magdB = 20*log10(abs(H));
[gd,wT] = grpdelay(N,D,wT);

figure; 
subplot(3,1,1);
plot(wT*180/pi,magdB);
axis([0 72 -0.1 0.0]);
ylabel('|H(e^j^\omega^T)| [dB]');
subplot(3,1,2);
plot(wT*180/pi,magdB);
axis([0 180 -100 10]);
ylabel('|H(e^j^\omega^T)| [dB]');
subplot(3,1,3);
plot(wT*180/pi,gd);
xlabel('\omegaT [degrees]');
ylabel('\tau_g(\omega) [T]');