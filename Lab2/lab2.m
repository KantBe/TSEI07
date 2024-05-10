%% LAB 2 %%

close all;
clc;

%% QUESTION 2.1.A.1 %%

wdc = 0.3*pi;
wds = 0.5*pi;
Amax = 0.1;
Amin = 60;

T=1;
wc=(2/T)*tan(wdc/2);
ws=(2/T)*tan(wds/2);

% Synthesis of the Butterworth filter
[N1, Wn1] = buttord(wc, ws, Amax, Amin, 's');
[Z1, P1, G1] = buttap(N1);
epsilon1 = sqrt(10^(0.1*Amax)-1);
w0p1 = wc*epsilon1^(-1/N1);
P1 = P1*w0p1;
G1 = G1*w0p1^N1;

% Synthesis of the Chebyshev-I filter
[N2, Wn2] = cheb1ord(wc, ws, Amax, Amin, 's');
[Z2, P2, G2] = cheb1ap(N2, Amax);
P2 = P2*wc;
G2 = G2*wc^N2;

% Synthesis of the Chebyshev-II filter
[N3, Wn3] = cheb2ord(wc, ws, Amax, Amin, 's');
[Z3, P3, G3] = cheb2ap(N3, Amin);
Z3 = Z3*ws;

P3 = P3*ws;
G3 = G3*ws^(length(P3)-length(Z3));

% Synthesis of the Cauer filter
[N4, Wn4] = ellipord(wc, ws, Amax, Amin, 's');
[Z4, P4, G4] = ellipap(N4, Amax, Amin);
Z4 = Z4*wc;
P4 = P4*wc;
G4 = G4*wc^(length(P4)-length(Z4));

%For this first filter, N1 = 14, N2 = 8, N3 = 8 and N4 = 6.

%% QUESTION 2.1.A.2 %%

wdc = 0.3*pi;
wds = 0.5*pi;
Amax = 0.01;
Amin = 80;

T=1;
wc=(2/T)*tan(wdc/2);
ws=(2/T)*tan(wds/2);

% Synthesis of the Butterworth filter
[N1, Wn1] = buttord(wc, ws, Amax, Amin, 's');
[Z1, P1, G1] = buttap(N1);
epsilon1 = sqrt(10^(0.1*Amax)-1);
w0p1 = wc*epsilon1^(-1/N1);
P1 = P1*w0p1;
G1 = G1*w0p1^N1;

% Synthesis of the Chebyshev-I filter
[N2, Wn2] = cheb1ord(wc, ws, Amax, Amin, 's');
[Z2, P2, G2] = cheb1ap(N2, Amax);
P2 = P2*wc;
G2 = G2*wc^N2;

% Synthesis of the Chebyshev-II filter
[N3, Wn3] = cheb2ord(wc, ws, Amax, Amin, 's');
[Z3, P3, G3] = cheb2ap(N3, Amin);
Z3 = Z3*ws;

P3 = P3*ws;
G3 = G3*ws^(length(P3)-length(Z3));

% Synthesis of the Cauer filter
[N4, Wn4] = ellipord(wc, ws, Amax, Amin, 's');
[Z4, P4, G4] = ellipap(N4, Amax, Amin);
Z4 = Z4*wc;
P4 = P4*wc;
G4 = G4*wc^(length(P4)-length(Z4));

%For this second filter, N1 = 19, N2 = 10, N3 = 10 and N4 = 7.

%% QUESTION 2.1.A.3 %%

wdc = 0.45*pi;
wds = 0.5*pi;
Amax = 0.1;
Amin = 60;

T=1;
wc=(2/T)*tan(wdc/2);
ws=(2/T)*tan(wds/2);

% Synthesis of the Butterworth filter
[N1, Wn1] = buttord(wc, ws, Amax, Amin, 's');
[Z1, P1, G1] = buttap(N1);
epsilon1 = sqrt(10^(0.1*Amax)-1);
w0p1 = wc*epsilon1^(-1/N1);
P1 = P1*w0p1;
G1 = G1*w0p1^N1;

% Synthesis of the Chebyshev-I filter
[N2, Wn2] = cheb1ord(wc, ws, Amax, Amin, 's');
[Z2, P2, G2] = cheb1ap(N2, Amax);
P2 = P2*wc;
G2 = G2*wc^N2;

% Synthesis of the Chebyshev-II filter
[N3, Wn3] = cheb2ord(wc, ws, Amax, Amin, 's');
[Z3, P3, G3] = cheb2ap(N3, Amin);
Z3 = Z3*ws;

P3 = P3*ws;
G3 = G3*ws^(length(P3)-length(Z3));

% Synthesis of the Cauer filter
[N4, Wn4] = ellipord(wc, ws, Amax, Amin, 's');
[Z4, P4, G4] = ellipap(N4, Amax, Amin);
Z4 = Z4*wc;
P4 = P4*wc;
G4 = G4*wc^(length(P4)-length(Z4));

%For this third filter, N1 = 56, N2 = 17, N3 = 17 and N4 = 9.

%% QUESTION 2.1.B.1 %%

wc = 0.3*pi;
ws = 0.5*pi;
Amax = 0.1;
Amin = 60;
fs = 2*pi;

T=1;
wac=(2/T)*tan(wc/2);
was=(2/T)*tan(ws/2);

% Synthesis of the Butterworth filter
[Na, Wna] = buttord(wc, ws, Amax, Amin, 's');
[Za, Pa, Ga] = buttap(Na);
epsilon = sqrt(10^(0.1*Amax)-1);
w0p = wc*epsilon^(-1/Na);
Pa = Pa*w0p;
Ga = Ga*w0p^Na;

%Transformation of the analog filter into the discrete-time filter
[Z,P,G] = bilinear(Za,Pa,Ga,1/T);

% Computation of the magnitude response and group delay
wT = linspace(0,pi,5000);
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

figure;
zplane(Z, P);
grid;
title('Butterworth Digital Filter (Poles and Zeros)');

figure;
zplane(Za, Pa);
grid;
title('Butterworth Analog Filter (Poles and Zeros)');

%% QUESTION 2.1.B.2 %%

wc = 0.3*pi;
ws = 0.5*pi;
Amax = 0.1;
Amin = 60;
fs = 2*pi;

%Requirements for the corresponding analog lowpass filter
T=1;
wac=(2/T)*tan(wcT/2);
was=(2/T)*tan(wsT/2);

% Synthesis of the Chebyshev-II filter
[Na, Wna] = cheb1ord(wc, ws, Amax, Amin, 's');
[Za, Pa, Ga] = cheb1ap(Na, Amax);
Pa = Pa*ws;
Ga = Ga*ws^Na;

%Transformation of the analog filter into the discrete-time filter
[Z,P,G] = bilinear(Za,Pa,Ga,1/T);

% Computation of the magnitude response and group delay
wT = linspace(0,pi,5000);
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

figure;
zplane(Z, P);
grid;
title('Chebyshev-I Digital Filter (Poles and Zeros)');

figure;
zplane(Za, Pa);
grid;
title('Chebyshev-I Analog Filter (Poles and Zeros)');

%% QUESTION 2.1.B.3 %%

wc = 0.3*pi;
ws = 0.5*pi;
Amax = 0.1;
Amin = 60;
fs = 2*pi;

%Requirements for the corresponding analog lowpass filter
T=1;
wac=(2/T)*tan(wcT/2);
was=(2/T)*tan(wsT/2);

% Synthesis of the Chebyshev-II filter
[Na, Wna] = cheb2ord(wc, ws, Amax, Amin, 's');
[Za, Pa, Ga] = cheb2ap(Na, Amin);
Za = Za*ws;
Pa = Pa*ws;
Ga = Ga*ws^(length(Pa)-length(Za));

%Transformation of the analog filter into the discrete-time filter
[Z,P,G] = bilinear(Za,Pa,Ga,1/T);

% Computation of the magnitude response and group delay
wT = linspace(0,pi,5000);
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

figure;
zplane(Z, P);
grid;
title('Chebyshev-II Digital Filter (Poles and Zeros)');

figure;
zplane(Za, Pa);
grid;
title('Chebyshev-II Analog Filter (Poles and Zeros)');

%% QUESTION 2.1.B.4 %%

wcT = 0.3*pi;
wsT = 0.5*pi;
Amax = 0.1;
Amin = 60;
fs = 2*pi;

%Requirements for the corresponding analog lowpass filter
T=1;
wac=(2/T)*tan(wcT/2);
was=(2/T)*tan(wsT/2);

% Synthesis of the analog lowpass filter (Cauer)
[Na,Wan] = ellipord(wac,was,Amax,Amin,'s');
[Za,Pa,Ga] = ellipap(Na,Amax,Amin);
Za = Za*wac;
Pa = Pa*wac;
Ga = Ga*wac^(length(Pa)-length(Za));

%Transformation of the analog filter into the discrete-time filter
[Z,P,G] = bilinear(Za,Pa,Ga,1/T);

% Computation of the magnitude response and group delay
wT = linspace(0,pi,5000);
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

figure;
zplane(Z, P);
grid;
title('Cauer Digital Filter (Poles and Zeros)');

figure;
zplane(Za, Pa);
grid;
title('Cauer Analog Filter (Poles and Zeros)');

%% QUESTION 2.1.C %%

%The group delay in the passband is a direct measure of the phase linearity
%of the filter. We can increase the bandpass width.

%Page 22

%% QUESTION 2.2.1 %%

% Requirements for the highpass filter
wc = 0.75*pi;
ws = 0.5*pi;
Amax = 0.1;
Amin = 60;

% Requirements for the corresponding lowpass filter
wclp = wc;
wslp = wc^2/ws;

% Synthesis of the lowpass filter (Cauer)
[Nlp, Wn] = ellipord(wclp, wslp, Amax, Amin, 's');
[Zlp, Plp, Glp] = ellipap(Nlp, Amax, Amin);
Zlp = Zlp*wclp;
Plp = Plp*wclp;
Glp = Glp*wclp^(length(Plp)-length(Zlp));

%Transformation of the analog filter into the discrete-time filter
[Zlpd, Plpd, Glpd] = bilinear(Zlp, Plp, Glp, 1/T);

% Transformation of the lowpass filter into the highpass filter
[Z, P] = zp2hp(Zlp, Plp, wc^2);
N = Nlp;
Z = Z;
P = P;
G = 1;

%Transformation of the analog filter into the discrete-time filter
[Zd, Pd, Gd] = bilinear(Z, P, G, 1/T);

% Computation of the magnitude response
wT = linspace(0,pi,5000);
[Nd, D] = zp2tf(Zd, Pd, Gd);
[H,wT] = freqz(Nd, D, wT);
magdB = 20*log10(abs(H));

figure; 
plot(wT*180/pi,magdB);
ylabel('|H(e^j^\omega^T)| [dB]');

figure;
zplane(Z, P);
grid;
title('HP Analog Filter (Poles and Zeros)');

figure;
zplane(Zd, Pd);
grid;
title('HP Digital Filter (Poles and Zeros)');

figure;
zplane(Zlpd, Plpd);
grid;
title('LP Digital Filter (Poles and Zeros)');

figure;
zplane(Zlp, Plp);
grid;
title('LP Analog Filter (Poles and Zeros)');

%% QUESTION 2.2.2 %%

% Requirements for the bandpass filter
wc1 = 0.4*pi;
wc2 = 0.5*pi;
ws1 = 0.3*pi;
ws2 = 0.7*pi;
Amax = 0.1;
Amin = 60;
fs = 2*pi;

%Requirements for the corresponding analog bandpass filter
T=1;
wac=(2/T)*tan(wc/2);
was=(2/T)*tan(ws/2);

if wc1*wc2 ~= ws1*ws2
    ws1 = wc1*wc2/ws2; 
end

% Requirements for the corresponding lowpass filter
wclp = wc2-wc1;
wslp = ws2-ws1;
wi2 = wc1*wc2;

% Synthesis of the lowpass filter (Cauer)
[Nlp, Wn] = ellipord(wclp, wslp, Amax, Amin, 's');
[Zlp, Plp, Glp] = ellipap(Nlp, Amax, Amin);
Zlp = Zlp*wclp;
Plp = Plp*wclp;
Glp = Glp*wclp^(length(Plp)-length(Zlp));

%Transformation of the analog filter into the discrete-time filter
[Zlpd, Plpd, Glpd] = bilinear(Zlp, Plp, Glp, 1/T);

% Transformation of the lowpass filter into the bandpass filter
[Z, P] = zp2bp(Zlp, Plp, wi2);
N = 2*Nlp;
G = Glp;

%Transformation of the analog filter into the discrete-time filter
[Zd, Pd, Gd] = bilinear(Z, P, G, 1/T);

% Computation of the magnitude response
wT = linspace(0,pi,5000);
[Nd, D] = zp2tf(Zd, Pd, Gd);
[H,wT] = freqz(Nd, D, wT);
magdB = 20*log10(abs(H));

figure; 
plot(wT*180/pi,magdB);
ylabel('|H(e^j^\omega^T)| [dB]');

figure;
zplane(Z, P);
grid;
title('BP Analog Filter (Poles and Zeros)');

figure;
zplane(Zd, Pd);
grid;
title('BP Digital Filter (Poles and Zeros)');

figure;
zplane(Zlpd, Plpd);
grid;
title('LP Digital Filter (Poles and Zeros)');

figure;
zplane(Zlp, Plp);
grid;
title('LP Analog Filter (Poles and Zeros)');

%% QUESTION 2.2.3 %%

% Requirements for the bandstop filter
wc1 = 0.3*pi;
wc2 = 0.7*pi;
ws1 = 0.4*pi;
ws2 = 0.6*pi;
Amax = 0.1;
Amin = 60;
fs = 2*pi;

if wc1*wc2 ~= ws1*ws2
    wc1 = ws1*ws2/wc2;
end

% Requirements for the corresponding lowpass filter
wi2 = wc1*wc2;
wclp = wi2/(wc2-wc1);
wslp = wi2/(ws2-ws1);

% Synthesis of the lowpass filter (Cauer)
[Nlp, Wn] = ellipord(wclp, wslp, Amax, Amin, 's');
[Zlp, Plp, Glp] = ellipap(Nlp, Amax, Amin);
Zlp = Zlp*wclp;
Plp = Plp*wclp;
Glp = Glp*wclp^(length(Plp)-length(Zlp));

%Transformation of the analog filter into the discrete-time filter
[Zlpd, Plpd, Glpd] = bilinear(Zlp, Plp, Glp, 1/T);

% Transformation of the lowpass filter into the bandstop filter
[Z, P] = zp2bs(Zlp, Plp, wi2);
N = 2*Nlp;
Z = Z;
P = P;
G = 1;

%Transformation of the analog filter into the discrete-time filter
[Zd, Pd, Gd] = bilinear(Z, P, G, 1/T);

% Computation of the magnitude response
wT = linspace(0,pi,5000);
[Nd, D] = zp2tf(Zd, Pd, Gd);
[H,wT] = freqz(Nd, D, wT);
magdB = 20*log10(abs(H));

figure; 
plot(wT*180/pi,magdB);
ylabel('|H(e^j^\omega^T)| [dB]');

figure;
zplane(Z, P);
grid;
title('BS Analog Filter (Poles and Zeros)');

figure;
zplane(Zd, Pd);
grid;
title('BS Digital Filter (Poles and Zeros)');

figure;
zplane(Zlpd, Plpd);
grid;
title('LP Digital Filter (Poles and Zeros)');

figure;
zplane(Zlp, Plp);
grid;
title('LP Analog Filter (Poles and Zeros)');
