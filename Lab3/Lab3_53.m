%% 5.3.2 to 5.3.4

load('Inputs.mat');

s0u2=upsample(2*s0,2);
s0u2m0=conv(s0u2,m0);
s0u2m0d2=downsample(s0u2m0,2);

%freqz(s0u2m0d2);

s1u2=upsample(2*s1,2);
s1u2m1=conv(s1u2,m1);
s1u2m1d2=downsample(s1u2m1,2);

%figure;
%freqz(s1u2m1d2);


% 5.3.3
delay0=length(m0)/2;
s0u2m0d2_delayed=s0u2m0d2(delay0+1:end); 
delay0=length(m1)/2;
s1u2m1d2_delayed=s1u2m1d2(delay1+1:end);

% 5.3.4
m0r=Sym2Msg(s0u2m0d2,16)
m1r=Sym2Msg(s1u2m1d2,16)

%% 5.3.5

%load('Filters1.mat');
%load('Filters2.mat');
load('Filters3.mat');

f0u2=upsample(2*f0,2);
f0u2h0=conv(f0u2,h0);
f0u2h0d2=downsample(f0u2h0,2);

delay0=length(h0)/2;
f0u2h0d2_delayed=f0u2h0d2(delay0+1:end); 

freqz(f0u2h0d2);

f1u2=upsample(2*f1_delayed,2);
f1u2h1=conv(f1u2,m1);
f1u2h1d2=downsample(f1u2h1,2);

delay1=length(h1)/2;
f1u2h1d2_delayed=f1u2h1d2(delay1+1:end);

figure;
freqz(f1u2h1d2);

%% 5.3.6

load('Inputs.mat');
load('Filters1.mat');
%load('Filters2.mat');
%load('Filters3.mat');

s0u2=upsample(2*s0,2);
s0u2f0=conv(s0u2,f0);
s0u2f0h0=conv(s0u2f0,h0);
s0u2f0h0d2=downsample(s0u2f0h0,2);
delay0=length(f0)/2;
s0u2f0h0d2_delayed=s0u2f0h0d2(1+delay0:length(s0)+delay0);
m0=Sym2Msg(s0,16)
m0r=Sym2Msg(s0u2f0h0d2_delayed,16)
SNR_s0=10*log(sum(abs(s0).^2)/sum(abs(s0u2f0h0d2_delayed-s0).^2))

s1u2=upsample(2*s1,2);
s1u2f1=conv(s1u2,f1);
s1u2f1h1=conv(s1u2f1,h1);
s1u2f1h1d2=downsample(s1u2f1h1,2);
delay1=length(f1)/2;
s1u2f1h1d2_delayed=s1u2f1h1d2(1+delay1:length(s1)+delay1);
m1=Sym2Msg(s1,16)
m1r=Sym2Msg(s1u2f1h1d2_delayed,16)
SNR_s1=10*log(sum(abs(s1).^2)/sum(abs(s1u2f1h1d2_delayed-s1).^2))

%% 5.3.7

load('Inputs.mat');
load('Filters3.mat');

wT=linspace(0,pi,512);

%for i=1:length(s0)
%    if rem(i,2) == 1
%        s0square(i)=s0(i);
%    else
%        s0square(i)=0;
%    end
%end
s0square=s0(1:2:end);
[S0square,~]=freqz(s0);
plot(wT/pi, 20*log10(abs(S0)))
ylim([-20 60])

%for i=1:length(s1)
%    if rem(i,2) == 1
%        s1square(i)=s0(i);
%    else
%        s1square(i)=0;
%    end
%end
s1square=s1(1:2:end);
figure;
[S1,~]=freqz(s1);
plot(wT/pi, 20*log10(abs(S1)))
ylim([-20 60])

s0u2=upsample(2*s0,2);
x0=conv(s0u2,f0);
figure;
[X0,~]=freqz(x0);
plot(wT/pi, 20*log10(abs(X0)))
ylim([-20 60])

s1u2=upsample(2*s1,2);
x1=conv(s1u2,f1);
figure;
[X1,~]=freqz(x1);
plot(wT/pi, 20*log10(abs(X1)))
ylim([-20 60])

y=x0+x1;
figure;
[Y,~]=freqz(y);
plot(wT/pi, 20*log10(abs(Y)))
ylim([-20 60])

v0=conv(y,h0);
figure;
[V0,~]=freqz(v0);
plot(wT/pi, 20*log10(abs(V0)))
ylim([-20 60])

v1=conv(y,h1);
figure;
[V1,~]=freqz(v1);
plot(wT/pi, 20*log10(abs(V1)))
ylim([-20 60])

s0hat=downsample(v0,2);
figure;
[S0hat,~]=freqz(s0hat);
plot(wT/pi, 20*log10(abs(S0hat)))
ylim([-20 60])

s1hat=downsample(v1,2);
figure;
[S1hat,~]=freqz(s1hat);
plot(wT/pi, 20*log10(abs(S1hat)))
ylim([-20 60])

%%

load('Inputs.mat');
freqz(s0);
figure;
freqz(s1);