function Msg = Sym2Msg(x,QAM_Type)

Sym = qamdemod(x,QAM_Type);

    for i = 1:length(Sym)                
       if     (Sym(i) == 0)
           Msg(i)='T';
       elseif (Sym(i) == 1)
           Msg(i)='h';
       elseif (Sym(i) == 2)
           Msg(i)='e';
       elseif (Sym(i) == 3)
           Msg(i)='m';
       elseif (Sym(i) == 4)
           Msg(i)='s';
       elseif (Sym(i) == 5)
           Msg(i)='g';
       elseif (Sym(i) == 6)
           Msg(i)='f';
       elseif (Sym(i) == 7)
           Msg(i)='o';
       elseif (Sym(i) == 8)
           Msg(i)='r';
       elseif (Sym(i) == 9)
           Msg(i)='c';
       elseif (Sym(i) == 10)
           Msg(i)='a';
       elseif (Sym(i) == 11)
           Msg(i)='n';
       elseif (Sym(i) == 12)
           Msg(i)='l';                 
       elseif (Sym(i) == 13)
           Msg(i)='w';            
       elseif (Sym(i) == 14)
           Msg(i)='t';            
       elseif (Sym(i) == 15)
           Msg(i)=' ';              
       end      
       
    end
    
    
    
