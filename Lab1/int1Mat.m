function u=intMat1(t,m,w1T,w2T)

M=length(m);
if t==1
	u(1)=w2T-w1T;
	u(2:M)=sin(w2T*(m(2:M)-1))./(m(2:M)-1)-sin(w1T*(m(2:M)-1))./(m(2:M)-1);

elseif t==2
	u=sin(w2T*(m-1/2))./(m-1/2)-sin(w1T*(m-1/2))./(m-1/2);

elseif t==3
	u=-cos(w2T*m)./m+cos(w1T*m)./m;

elseif t==4
	u=-cos(w2T*(m-1/2))./(m-1/2)+cos(w1T*(m-1/2))./(m-1/2);
end



