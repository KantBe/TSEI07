% Filter 3
wc1=0.3*pi;
wc2=0.7*pi;
ws1=0.4*pi;
ws2=0.6*pi;
Amax=0.1;
Amin=60;

T=1;
wac1=(2/T)*tan(wc1/2);
wac2=(2/T)*tan(wc2/2);
was1=(2/T)*tan(ws1/2);
was2=(2/T)*tan(ws2/2);

wi2=wac1*wac2;
wac=wi2/(wac2-wac1);
was=wi2/(was2-was1);

% Synthesis of the Cauer filter
[N,Wn]=ellipord(wac,was,Amax,Amin,'s');
[Z,P,G]=ellipap(N,Amax,Amin);
Z=Z*wc;
P=P*wc;
G=G*wc^(length(P)-length(Z));

[Zd,Pd,Gd]=bilinear(Z,P,G,1/T);

[Zbs, Pbs]=zp2bs(Z,P,wi2);
Gbs=1;

[Zbsd,Pbsd,Gbsd]=bilinear(Zbs,Pbs,Gbs,1/T);

wT=linspace(0,pi,5000);
[Nbsd,D]=zp2tf(Zbsd,Pbsd,Gbsd);
[H,wT]=freqz(Nbsd,D,wT);
magdB=20*log10(abs(H));

plot(wT/pi,magdB);
xlabel('\omegaT [rad]');
ylabel('|H(e^j^\omega^T)| [dB]');

figure;
zplane(Z,P);
grid;

figure;
zplane(Zd,Pd);
grid;

figure;
zplane(Zbs,Pbs);
grid;

figure;
zplane(Zbsd,Pbsd);
grid;