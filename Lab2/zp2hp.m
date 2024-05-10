function [zhp, php] = zp2hp(z,p,wi2)
% Transformerar poler och nollstallen fran LP till HP

lz=length(z);
lp=length(p);

% Transformera nollstallen
for i=1:lz,
    zhp(i) = wi2/z(i);
end

% Transformera poler
for i=1:lp,
    php(i) = wi2/p(i);
end

% Transformera nollstallen i oandligheten
for i=lz+1:lp,
    zhp(i)=0;
end

zhp=zhp';
php=php';
