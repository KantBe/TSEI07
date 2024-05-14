Fs=16000;

h_LP = Ex13cLP;                                 
[H_LP,wt]=freqz(h_LP);
H_LP_SB=H_LP(wt > 0.4*pi);
E_LP=10*log10(sum(2/(pi-0.4*pi)/length(H_LP_SB)*abs(H_LP_SB).^2));

h_QP = Ex13cQP;                                 
[H_QP,wt]=freqz(h_QP);
H_QP_SB=H_QP(wt > 0.4*pi);
E_QP=10*log10(sum(2/(pi-0.4*pi)/length(H_QP_SB)*abs(H_QP_SB).^2));    

freqz(Ex13cLP(),1,1024,Fs)
hold on
freqz(Ex13cQP(),1,1024,Fs)
legend('LP', 'QP')
[E_LP E_QP]