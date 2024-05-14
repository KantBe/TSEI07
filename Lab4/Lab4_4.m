%%

Wf=8;
Wr=12;

x=2*(rand(1,1000)-0.5);

yI_d=directFormFilter(x,0,Wf);
yI_5=fifthOrderLadderWDF(x,Wf);
yQ_d=directFormFilter(x,0,Wf,Wr);
yQ_5=fifthOrderLadderWDF(x,Wf,Wr);

error_d=yI_d-yQ_d;
noise_pw_d=10*log10(var(error_d));
signal_pw_d=10*log10(var(yQ_d));
SNR_d=signal_pw_d-noise_pw_d

error_5=yI_5-yQ_5;
noise_pw_5=10*log10(var(error_5));
signal_pw_5=10*log10(var(yQ_5));
SNR_5=signal_pw_5-noise_pw_5

yI_d_scaled=directFormFilter(x,1,Wf);
yQ_d_scaled=directFormFilter(x,1,Wf,Wr);
error_d_scaled=yI_d_scaled-yQ_d_scaled;
noise_pw_d_scaled=10*log10(var(error_d_scaled));
signal_pw_d_scaled=10*log10(var(yQ_d_scaled));
SNR_d_scaled=signal_pw_d_scaled-noise_pw_d_scaled