%%

delta=zeros(250,1);
delta(1)=1;  

[h,cnodes]=fifthOrderLadderWDF(delta);
wT=linspace(0,pi,250); 
freqz(h,1,wT);

L2_1=sqrt(sum(abs(cnodes(1,:)).^2))
L2_2=sqrt(sum(abs(cnodes(2,:)).^2))
L2_3=sqrt(sum(abs(cnodes(3,:)).^2))
L2_4=sqrt(sum(abs(cnodes(4,:)).^2))
L2_5=sqrt(sum(abs(cnodes(5,:)).^2))
L2_6=sqrt(sum(abs(cnodes(6,:)).^2))
L2_7=sqrt(sum(abs(cnodes(7,:)).^2))
L2_8=sqrt(sum(abs(cnodes(8,:)).^2))

%%

Wf=5;

delta=zeros(250,1);
delta(1)=1;  

[h,cnodes]=fifthOrderLadderWDF(delta, Wf);
wT=linspace(0,pi,250); 
freqz(h,1,wT);