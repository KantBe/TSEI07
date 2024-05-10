function M=trigMat(t,m,wT)

if t==1
	for k=1:length(wT)
		M(k,1:length(m))=cos((m-1)*wT(k));
	end
elseif t==2
	for k=1:length(wT)
		M(k,1:length(m))=cos((m-1/2)*wT(k));
	end
elseif t==3
	for k=1:length(wT)
		M(k,1:length(m))=sin(m*wT(k));
	end
elseif t==4
	for k=1:length(wT)
		M(k,1:length(m))=sin((m-1/2)*wT(k));
	end
end
