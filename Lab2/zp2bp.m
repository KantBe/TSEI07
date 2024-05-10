function [zbp, pbp] = zp2bp(z,p,wi2)
% Transformerar poler och nollstallen fran LP till BP

lnz=length(z);
lnp=length(p);

% Transformera nollstallen
for k=1:lnz,
    zbp(2*k-1) = z(k)/2 + sqrt((z(k)^2)/4-wi2);
    zbp(2*k) = z(k)/2 - sqrt((z(k)^2)/4-wi2);
end

% Transformera poler
for k=1:lnp,
    pbp(2*k-1) = p(k)/2 + sqrt((p(k)^2)/4-wi2);
    pbp(2*k) = p(k)/2 - sqrt((p(k)^2)/4-wi2);
end

% Transformera nollstallen i oandligheten
for k=lnz+1:lnp,
    zbp(lnz+k)=0;
end

zbp=zbp';
pbp=pbp';
