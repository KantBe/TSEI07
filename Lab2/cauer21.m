% Requirements for the lowpass filter
% Filter 1
wc=0.75;
ws=0.5;
Amax=0.1;
Amin=60;

% Synthesis of the Cauer filter
[N,Wn]=ellipord(wc,ws,Amax,Amin,'s');
[Z,P,G]=ellipap(N,Amax,Amin);
Z=Z*wc;
P=P*wc;
G=G*wc^(length(P)-length(Z));

[Zd,Pd,Gd]=bilinear(Z,P,G,0.5);

wT=linspace(0,pi,5000);
[N,D]=zp2tf(Zd,Pd,Gd);
[H,wT]=freqz(N,D,wT);
magdB=20*log10(abs(H));

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

figure;
zplane(Zd, Pd);
grid;

figure;
zplane(Z, P);
grid;