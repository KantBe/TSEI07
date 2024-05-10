h_LP = Ex13cLP;                                 
m_LP = 20*log10(abs(h_LP));                     
E_LP = 20*log10(sum(abs(m_LP(0.4*pi:end))));    

h_QP = Ex13cQP;                                 
m_QP = 20*log10(abs(h_QP));                     
E_QP = 20*log10(sum(abs(m_QP(0.4*pi:end))));    

freqz(Ex13cLP(),1,1024,Fs)
hold on
freqz(Ex13cQP(),1,1024,Fs)
legend('LP', 'QP')
[E_LP E_QP]