declare SumAux
fun {ProduceInts N} 
   fun {ProduceAux I N} 
      if I >= N then N|nil 
      else 
	 I|{ProduceAux I+1 N} 
      end 
   end 
in 
   {ProduceAux 1 N} 
end

fun {Sum Str}
   fun{SumAux Acc Str}
      case Str
      of nil then Acc
      [] H|T then {SumAux Acc+H T}
      end
   end
   {SumAux 0 Str}
end


declare Xs S
thread Xs = {ProduceInts 666} end
thread S = {Sum Xs} end
{Browse S}


%La première version prendra 666 secondes, la seconde deux fois plus longtemps