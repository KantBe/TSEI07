%% 5.2.1

load('Filters2.mat');

f0h0=conv(f0,h0);
freqz(f0h0);

f0h1=conv(f0,h1);
figure;
freqz(f0h1);

f1h1=conv(f1,h1);
figure;
freqz(f1h1);

%% 5.2.2

load('Filters1.mat');
%load('Filters2.mat');
%load('Filters3.mat');

f0h0=conv(f0,h0);
f0h0odd=f0h0(1:2:end);
f0h1=conv(f0,h1);
f0h1odd=f0h1(1:2:end);
f1h1=conv(f1,h1);
f1h1odd=f1h1(1:2:end);

subplot(3,1,1);
stem(f0h0odd);
title('f0h0');
subplot(3,1,2);
stem(f0h1odd);
title('f0h1');
subplot(3,1,3);
stem(f1h1odd);
title('f1h1');

%% 5.2.3

%load('Filters1.mat');
%load('Filters2.mat');
load('Filters3.mat');

f0h0=conv(f0,h0);
f0h0odd=f0h0(1:2:end);
f1h1=conv(f1,h1);
f1h1odd=f1h1(1:2:end);

[F0H0,~]=freqz(f0h0odd);
f0h0_m=20*log10(abs(F0H0));
delta_c00_max=max(f0h0_m);
delta_c00_min=min(f0h0_m);
delta_c00=(delta_c00_max-delta_c00_min)/2

[F1H1,~]=freqz(f1h1odd);
f1h1_m=20*log10(abs(F1H1));
delta_c11_max=max(f1h1_m);
delta_c11_min=min(f1h1_m);
delta_c11=(delta_c11_max-delta_c11_min)/2

%% 5.2.4

load('Filters2.mat');

[F0,~]=freqz(f0);
[F1,~]=freqz(f1);

S2=(abs(F0)).^2+(abs(F1)).^2;

load('Filters4.mat');

[F0,~]=freqz(f0);
[F1,~]=freqz(f1);

S4=(abs(F0)).^2+(abs(F1)).^2;

wT=linspace(0,pi,512);

subplot(2,1,1)
plot(wT/pi,S2)
grid
ylabel('Filters2');
subplot(2,1,2)
plot(wT/pi,S4)
grid
ylabel('Filters4');
xlabel('\omegaT [\times\pi rad]');