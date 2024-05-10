function [gd,w]=groupdelay(Z,P,G,w,fsample)
% Beraknar grupploptiden tg(w) for ett analogt filter givet
% dess nollstallen (Z), poler (P) och forstarkningskonstant (G)

[Zd,Pd,Gd]=bilinear(Z,P,G,fsample);
[Nd,Dd]=zp2tf(Zd,Pd,Gd);
wT=2*atan(w/(2*fsample));
[gd,wT]=grpdelay(Nd,Dd,wT);
gd=(1/fsample).*gd.*cos(wT/2).*cos(wT/2);
