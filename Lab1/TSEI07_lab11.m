Fs=16000;
m=[1 0];
f=[0.3*Fs/2 0.4*Fs/2];
dev=[0.01 0.001];
[n,fo,mo,w]=firpmord(f,m,dev,Fs)
b = firpm(52,fo,mo,w)
freqz(b,1,1024,Fs)



