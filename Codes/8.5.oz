declare 
fun {Counter Str}
   
   fun {UpdateL L Ch} 
      case L 
      of nil then (Ch#1)|nil 
      [] H|T then 
	 case H 
	 of H1#H2 then 
	    if H1 == Ch then 
	       (H1#(H2+1))|T 
	    else 
	       H|{UpdateL T Ch} 
	    end 
	 end 
      end 
   end 
   fun {CAcc S Acc}
      A2 in 
      case S 
      of H|T then 
	 A2 = {UpdateL Acc H} 
	 A2|{CAcc T A2} 
      else nil 
      end 
   end 
in 
   thread {CAcc Str nil} end 
end 

 

local InS in 
   {Browse {Counter InS}} 
   InS = a|b|a|c|d|e|b|e|_ 
end 