% Filter 1
wc=0.75*pi;
wshp=0.5*pi;
Amax=0.1;
Amin=60;

T=1;
wac=(2/T)*tan(wc/2);
washp=(2/T)*tan(wshp/2);
was=wac^2/washp;

% Synthesis of the Cauer filter
[N,Wn]=ellipord(wac,was,Amax,Amin,'s');
[Z,P,G]=ellipap(N,Amax,Amin);
Z=Z*wc;
P=P*wc;
G=G*wc^(length(P)-length(Z));

[Zd,Pd,Gd]=bilinear(Z,P,G,1);

[Zhp,Php]=zp2hp(Z,P,wc^2);

[Zhpd,Phpd,Ghpd]=bilinear(Zhp,Php,1,1/T);

wT=linspace(0,pi,5000);
[Nhp,Dhp]=zp2tf(Zhpd,Php,Ghpd);
[H,wT]=freqz(Nhp,Dhp,wT);
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
zplane(Zhp, Php);
grid;

figure;
zplane(Zhpd, Phpd);
grid;