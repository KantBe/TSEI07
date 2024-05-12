%% 5.1.1

load('Filters2.mat');

subplot(2,1,1);
stem(f0);
axis tight;
grid;
title('f0');
xlabel('n') 
ylabel('h0(n)')
subplot(2,1,2);
stem(f1);
axis tight;
grid;
title('f1');
xlabel('n') 
ylabel('h1(n)')

N0=length(f0)
N1=length(f1)

%% 5.1.2

load('Filters2.mat');

freqz(f0);
grid;
figure;
freqz(f1);
grid;

%% 5.1.3

%load('Filters1.mat');
%load('Filters2.mat');
load('Filters3.mat');

[F0,~]=freqz(f0);
f0_m=20*log10(abs(F0));
f0_delta_c=f0_m(1:200);
f0_delta_s=f0_m(300:end);
delta_c0_max=max(f0_delta_c);
delta_c0_min=min(f0_delta_c);
delta_c0=(delta_c0_max-delta_c0_min)/2
delta_s0=abs(max(f0_delta_s))

[F1,~]=freqz(f1);
f1_m=20*log10(abs(F1));
f1_delta_c=f1_m(300:end);
f1_delta_s=f1_m(1:200);
delta_c1_max=max(f1_delta_c);
delta_c1_min=min(f1_delta_c);
delta_c1=(delta_c1_max-delta_c1_min)/2
delta_s1=abs(max(f1_delta_s))

%% 5.1.4

load('Filters2.mat');

figure;
subplot(2,1,1);
zplane(f0);
xlim([-3 3])
ylim([-1.3 1.3])
grid;
title('f0');
subplot(2,1,2);
zplane(f1);
xlim([-3 3])
ylim([-1.3 1.3])
grid;
title('f1');

