function [zbs, pbs] = zp2bs(z,p,wi2)
% Transformerar poler och nollstallen fran LP till BS

lz=length(z);
lp=length(p);

% Transformera nollstallen
for i=1:lz,
    zbs(2*i-1) = wi2/(2*z(i)) + sqrt(wi2^2/((z(i)^2)*4)-wi2);
    zbs(2*i) = wi2/(2*z(i)) - sqrt(wi2^2/((z(i)^2)*4)-wi2);
end

% Transformera poler
for i=1:lp,
    pbs(2*i-1) = wi2/(2*p(i)) + sqrt(wi2^2/((p(i)^2)*4)-wi2);
    pbs(2*i) = wi2/(2*p(i)) - sqrt(wi2^2/((p(i)^2)*4)-wi2);
end

% Transformera nollstallen i oandligheten
for i=lz+1:lp,
    zbs(2*i-1)=j*sqrt(wi2);
    zbs(2*i)=-j*sqrt(wi2);
end

zbs=zbs';
pbs=pbs';
