%%

load('fifthOrderFilter.mat');

l=250

delta=zeros(l,1);
delta(1)=1;
h=directFormFilter(delta);
wT=linspace(0,pi,l);
H=freqz(h, 1, wT);
H1=freqz(b, a, wT);

plot(wT/pi, 20*log10(abs(H1)), 'b')
xlabel('Normalized frequency (\pi rad/sample)');
ylabel('Magnitude (dB)')
hold on;
plot(wT/pi, 20*log10(abs(H)), 'r')
grid on;
legend('fifthOrderFilter', 'directFormFilter(impulse)')

%%

NFFT=8192; % length of FFT
n=0:NFFT-1;
x=0.5*(sin(0.2171*pi*n)+sin(.631711*pi*n));
x=quant(x,2^-12); % quantize to 12 fractional bits

xw=x.*blackmanharris(NFFT).';
X=fft(xw);
wT=0:2*pi/NFFT:pi-2*pi/NFFT; % Convert FFT index k to wT

delta=zeros(250,1);
delta(1)=1;
h=directFormFilter(delta);
y=conv(x,h);
Y=fft(y);

subplot(2,1,1)
plot(wT/pi,20*log10(2*abs(Y(1:length(wT))/NFFT)));
ylabel('|X(k)| [dB]');
subplot(2,1,2)
plot(wT/pi,20*log10(2*abs(X(1:length(wT))/NFFT)));
ylabel('|Y(k)| [dB]');
xlabel('\omegaT [\times\pi rad]');

%%

Wf=9;

delta=zeros(250,1);
delta(1)=1;
h=directFormFilter(delta);
h_q=directFormFilter(delta,0,Wf);

wT=linspace(0,pi,250);

freqz(h,1,wT);
figure;
freqz(h_q,1,wT);

%%

Wf=9;                                      
delta=zeros(250,1);                 
delta(1)=1;                          
wT=linspace(0,pi,250);       
h=directFormFilter(delta,0,Wf);    
L2=sqrt(sum(abs(h).^2))

h_scale=directFormFilter(delta,1);         
H_scale=freqz(h_scale,1,wT); 
L2_scale=sqrt(sum(abs(h_scale).^2))

freqz(h_scale,1,wT); 