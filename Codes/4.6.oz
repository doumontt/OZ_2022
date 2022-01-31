declare
fun {PipeLine N}
   P1 P2 P3 in
   P1 = {GenerateList N}
   P2 = {MyFilter P1 fun {$ X} X mod 2 \= 0 end}
   P3 = {MyMap P2 fun {$ X} X * X end}
   {MyFoldL P3 fun {$ Acc X} X + Acc end 0}
end

fun {GenerateList N}
   fun {GenerateListAcc N Acc} 
      if Acc == N+1 then nil 
      else 
	 Acc|{GenerateListAcc N Acc+1} 
      end 
   end 
in 
   {GenerateListAcc N 1} 
end

fun {MyFilter L F} 
   case L 
   of H|T then 
      if {F H} then H|{MyFilter T F} 
      else {MyFilter T F} 
      end 
   [] nil then nil 
   end 
end 

 
fun {MyMap L F} 
   case L 
   of nil then nil 
   [] H|T then {F H}|{MyMap T F} 
   end 
end 

fun {MyFoldL L F Deb} 
   case L 
   of H|T then {MyFoldL T F {F Deb H}} 
   [] nil then Deb 
   end 
end 

{Browse {PipeLine 10}}
   