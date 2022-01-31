declare 
fun {Producer N} 
   fun {ProduceAux I N} 
      if I >= N then N|nil 
      else 
	 I|{ProduceAux I+1 N} 
      end 
   end 
in 
   {ProduceAux 1 N} 
end 

 

fun {Filter L} 
   case L 
   of nil then nil 
   [] H|T then 
      if H mod 2 == 0 then {Filter T} 
      else H|{Filter T} 
      end 
   end 
end 

fun {Consumer L} 
   fun {SumAux L Acc} 
      case L 
      of nil then Acc 
      [] H|T then {SumAux T Acc+H} 
      end 
   end 
in 
   {SumAux L 0} 
end 

declare Xs Ys Zs 
thread Xs = {Producer 500} end
thread Ys = {Filter Xs} end 
thread Zs = {Consumer Ys} end 
{Browse Zs} 