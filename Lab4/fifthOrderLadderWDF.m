function [output, cnodes] = fifthOrderLadderWDF(input, Wc, Wr)

if nargin < 2
    Wc = 64;
    Wr = 64;
elseif nargin < 3
    Wr = 64;
end

a1_1 = quant(0.410366383870482,2^-Wc);
a1_2 = quant(0.167585550872200,2^-Wc);
a1_3 = quant(0.211034363678024,2^-Wc);
a2_3 = quant(0.271498091115082,2^-Wc);
a1_4 = quant(0.228344874180013,2^-Wc);
a1_5 = quant(0.434623166811736,2^-Wc);
a1_6 = quant(0.176471886871252,2^-Wc);
a1_7 = quant(0.348963206587482,2^-Wc);



s11 = 0.5;
s12 = 0.5;
s13 = 0.5;
s14 = 0.5;
s15 = 1;

v1 = 0;
v2 = 0;
v3 = 0;
v4 = 0;
v5 = 0;
v6 = 0;
v7 = 0;



output = zeros(1, length(input));
cnodes = zeros(8,length(input)); % 8 critical nodes

for it = 1:length(input)
    x = input(it);
    
    % adaptor 1 -- parallel: initial
    in1_1 = s11*x;
    inD_1 = v1;
    t1_1 = inD_1 - in1_1;
    t2_1 = -a1_1*t1_1;
    t2_1 = quant(t2_1, 2^-Wr);
    u1 = (inD_1 + t2_1)/s11;
    cnodes(1,it) = t1_1;
    
    % adaptor 6 -- parallel: initial
    in1_6 = v3;
    inD_6 = -v2;
    t1_6 = inD_6 - in1_6;
    t2_6 = -a1_6*t1_6;
    t2_6 = quant(t2_6, 2^-Wr);
    u2 = inD_6 + t2_6;
    cnodes(7,it) = t1_6;
    
    % adaptor 2 -- serial: initial
    in1_2 = s12*u1;
    inD_2 = u2;
    t1_2 = in1_2 + inD_2;
    u3 = -t1_2/s12;
    
    % adaptor 5 -- parallel: initial
    in1_5 = s15*0;
    inD_5 = v7;
    t1_5 = inD_5 - in1_5;
    t2_5 = -a1_5*t1_5;
    t2_5 = quant(t2_5, 2^-Wr);
    u4 = (inD_5 + t2_5)/s15; 
    cnodes(6,it) = t1_5;
    
    % adaptor 7 -- parallel: initial
    in1_7 = v6;
    inD_7 = -v5;
    t1_7 = inD_7 - in1_7;
    t2_7 = -a1_7*t1_7;
    t2_7 = quant(t2_7, 2^-Wr);
    u5 = inD_7 + t2_7; 
    cnodes(8,it) = t1_7;
    
    % adaptor 4 -- serial: initial
    in1_4 = s14*u4;
    inD_4 = u5;
    t1_4 = in1_4 + inD_4;
    u6 = -t1_4/s14;    
     
    
    % adaptor 3 (no reflection free) -- parallel
    in1_3 = s13*u3;
    in2_3 = s13*u6;
    inD_3 = v4;
    t1_3 = inD_3 - in1_3;
    t2_3 = inD_3 - in2_3;
    t3_3 = -a1_3*t1_3;
    t3_3 = quant(t3_3, 2^-Wr);
    t4_3 = -a2_3*t2_3;
    t4_3 = quant(t4_3, 2^-Wr);
    u7 = (t1_3 + t3_3 + t4_3 + inD_3)/s13;
    u8 = (t2_3 + t3_3 + t4_3 + inD_3)/s13;
    u9 = t3_3 + t4_3 + inD_3;
    cnodes(3,it) = t1_3;
    cnodes(4,it) = t2_3;
    
    % adaptor 2 -- serial: final
    inR_2 = s12*u7;
    t2_2 = t1_2 + inR_2;
    t3_2 = -a1_2*t2_2;
    t3_2 = quant(t3_2, 2^-Wr);
    u10 = (in1_2 + t3_2)/s12;
    u11 = -(inR_2 + in1_2 + t3_2); 
    cnodes(2,it) = t2_2;
    
    % adaptor 1 -- parallel: final
    inR_1 = s11*u10;
    u12 = (t1_1 + t2_1 + inR_1)/s11;
    u13 = t2_1 + inR_1;    
    
    % adaptor 6 -- parallel: final
    inR_6 = u11;
    u14 = t1_6 + t2_6 + inR_6;
    u15 = t2_6 + inR_6;    
    
    % adaptor 4 -- serial: final
    inR_4 = s14*u8;
    t2_4 = t1_4 + inR_4;
    t3_4 = -a1_4*t2_4;
    t3_4 = quant(t3_4, 2^-Wr);
    u16 = (in1_4 + t3_4)/s14;
    u17 = -(inR_4 + in1_4 + t3_4);
    cnodes(5,it) = t2_4;
    
    % adaptor 7 -- parallel: final
    inR_7 = u17;
    u18 = t1_7 + t2_7 + inR_7;
    u19 = t2_7 + inR_7;  
    
    % adaptor 5 -- parallel: final
    inR_5 = s15*u16;
    u20 = (t1_5 + t2_5 + inR_5)/s15;
    u21 = t2_5 + inR_5;    
    
    output(it) = u20;
    
    v1 = u13;
    v2 = u15;
    v3 = u14;
    v4 = u9;
    v5 = u19;
    v6 = u18;
    v7 = u21;
    
    
end