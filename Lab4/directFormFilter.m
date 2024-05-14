function y = directFormFilter(inSignal, scale, Wc, Wr)

load('fifthOrderFilter.mat');

if nargin < 2
    scale = 0;
    Wc = 64;
    Wr = 64;
elseif nargin < 3
    Wc = 64;
    Wr = 64;
elseif nargin < 4
    Wr = 64;
end

inpScalingFactor = (1/0.602992409878436)^(scale>0);

u = zeros(1,length(b)-1); % input delay elements
v = zeros(1,length(a)-1); % output delays
y = zeros(1,length(inSignal));
Nq = quant(inpScalingFactor*b, 2^-Wc);
Dq = quant(a, 2^-Wc);


for it = 1:length(inSignal)
    x = inSignal(it);
    s = [x u];
    y(it) = sum(quant(s.*Nq, 2^-Wr)) - sum(quant(v.*Dq(2:end), 2^-Wr));
    u = s(1:end-1);
    v = [y(it) v(1:end-1)];
end


