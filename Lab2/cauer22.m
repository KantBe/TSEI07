% Filter 2
wc1=0.4*pi;
wc2=0.6*pi;
ws1=0.3*pi;
ws2=0.7*pi;
wsT=ws2-ws1;
Amax=0.1;
Amin=60;

T=1;
wac1=(2/T)*tan(wc1/2);
wac2=(2/T)*tan(wc2/2);
was1=(2/T)*tan(ws1/2);
was2=(2/T)*tan(ws2/2);

wac=wac2-wac1;
was=was2-was1;

% Synthesis of the Cauer filter
[N,Wn]=ellipord(wac,was,Amax,Amin,'s');
[Z,P,G]=ellipap(N,Amax,Amin);
Z=Z*wac;
P=P*wac;
G=G*wac^(length(P)-length(Z));

[Zd,Pd,Gd]=bilinear(Z,P,G,1/T);

wai2=wac1*wac2;
[Zbp, Pbp]=zp2bp(Z, P, wai2);
Gbp=G;

[Zbpd,Pbpd,Gbpd]=bilinear(Zbp,Pbp,Gbp,1/T);

wT=linspace(0,pi,5000);
[Nbpd,D]=zp2tf(Zbpd,Pbpd,Gbpd);
[H,wT]=freqz(Nbpd,D,wT);
magdB=20*log10(abs(H));

plot(wT/pi,magdB);
xlabel('\omegaT [rad]');
ylabel('|H(e^j^\omega^T)| [dB]');

figure;
zplane(Z, P);
grid;

figure;
zplane(Zd, Pd);
grid;

figure;
zplane(Zbp, Pbp);
grid;

figure;
zplane(Zbpd, Pbpd);
grid;