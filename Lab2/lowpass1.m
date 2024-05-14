% Requirements for the lowpass filter
% Filter 1
wcT=0.3*pi;
wsT=0.5*pi;
Amax=0.1;
Amin=60;

% Filter 2
% wcT=0.3;
% wsT=0.5;
% Amax=0.01;
% Amin=80;

% Filter 3
% wcT=0.45;
% wsT=0.5;
% Amax=0.1;
% Amin=60;

T=1;
wac=(2/T)*tan(wcT/2);
was=(2/T)*tan(wsT/2);

% Synthesis of the Butterworth filter
% [Na,Wan]=buttord(wac,was,Amax,Amin,'s');
% [Za,Pa,Ga]=buttap(Na);
% epsilon=sqrt(10^(0.1*Amax)-1);
% w0p=wac*epsilon^(-1/Na);
% Pa=Pa*w0p;
% Ga=Ga*w0p^Na;

% Synthesis of the Chebyshev-I filter
% [Na,Wan]=cheb1ord(wac,was,Amax,Amin,'s');
% [Za,Pa,Ga]=cheb1ap(Na,Amax);
% Pa=Pa*wac;
% Ga=Ga*wac^Na;

% Synthesis of the Chebyshev-II filter
% [Na,Wan]=cheb2ord(wac,was,Amax,Amin,'s');
% [Za,Pa,Ga]=cheb2ap(Na,Amin);
% Za=Za*ws;
% Pa=Pa*ws;
% Ga=Ga*ws^(length(Pa)-length(Za));

% Synthesis of the Cauer filter
[Na,Wna]=ellipord(wac,was,Amax,Amin,'s');
[Za,Pa,Ga]=ellipap(Na,Amax,Amin);
Za=Za*wc;
Pa=Pa*wc;
Ga=Ga*wc^(length(Pa)-length(Za));

[Z,P,G] = bilinear(Za,Pa,Ga,1/T);

wT = linspace(0,pi,5000);
[N,D] = zp2tf(Z,P,G);
[H,wT] = freqz(N,D,wT);
magdB = 20*log10(abs(H));
[gd,wT] = grpdelay(N,D,wT);

figure; 
subplot(3,1,1);
plot(wT,magdB);
axis([0 72 -0.1 0.0]);
ylabel('|H(e^j^\omega^T)| [dB]');
subplot(3,1,2);
plot(wT,magdB);
axis([0 180 -100 10]);
ylabel('|H(e^j^\omega^T)| [dB]');
subplot(3,1,3);
plot(wT,gd);
xlabel('\omegaT [degrees]');
ylabel('\tau_g(\omega) [T]');

figure;
zplane(Z, P);
grid;

figure;
zplane(Za, Pa);
grid;