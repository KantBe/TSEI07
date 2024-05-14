Fs=16000;

%Lowpass
% m=[1 0];
% f=[0.4*Fs/2 0.5*Fs/2];
% dev=[0.01 0.001];

%Highpass
%m=[0 1];
%f=[0.5*Fs/2 0.6*Fs/2];
%dev=[0.001 0.01];

%Bandpass
m=[0 1 0];
f=[0.3*Fs/2 0.4*Fs/2 0.6*Fs/2 0.7*Fs/2];
dev=[0.001 0.01 0.001];

%Bandstop
%m=[1 0 1];
%f=[0.3*Fs/2 0.4*Fs/2 0.6*Fs/2 0.7*Fs/2];
%dev=[0.01 0.001 0.01];

[n,fo,mo,w]=firpmord(f,m,dev,Fs)
%Lowpass
%n=53
%Highpass
%n=53
%Bandpass
%n=55
n=55;
b = firpm(n,fo,mo,w);
freqz(b,1,1024,Fs)