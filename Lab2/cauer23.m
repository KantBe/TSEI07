% Filter 2
wc1=0.3;
wc2=0.7;
wi2=wc1*wc2;
wc=wi2/(wc2-wc1);
ws1=0.4;
ws2=0.6;
ws=wi2/(ws2-ws1);
Amax=0.1;
Amin=60;

% Synthesis of the Cauer filter
[N,Wn]=ellipord(wc,ws,Amax,Amin,'s');
[Z,P,G]=ellipap(N,Amax,Amin);
Z=Z*wc;
P=P*wc;
G=G*wc^(length(P)-length(Z));

[Zd,Pd,Gd]=bilinear(Z,P,G,0.5);

[Zbp, Pbp]=zp2bp(Z, P, wi2);
Gbp=G;

[Zbpd,Pbpd,Gbpd]=bilinear(Zbp,Pbp,Gbp,0.5);

wT=linspace(0,pi,5000);
[Nbpd,D]=zp2tf(Zbpd,Pbpd,Gbpd);
[H,wT]=freqz(Nbpd,D,wT);
magdB=20*log10(abs(H));

figure; 
plot(wT*180/pi,magdB);
ylabel('|H(e^j^\omega^T)| [dB]');

figure;
zplane(Zbp, Pbp);
grid;
title('BP Analog Filter (Poles and Zeros)');

figure;
zplane(Zbpd, Pbpd);
grid;
title('BP Digital Filter (Poles and Zeros)');

figure;
zplane(Zd, Pd);
grid;
title('LP Digital Filter (Poles and Zeros)');

figure;
zplane(Z, P);
grid;
title('LP Analog Filter (Poles and Zeros)');