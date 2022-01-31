declare 
fun {Applique L F} 
   case L 
   of nil then nil 
   [] H|T then {F H}|{Applique T F} 
   else nil 
   end 
end 

fun {Pow N E} 
   case E 
   of 0 then 1 
   else N*{Pow N E-1} 
   end 
end 

fun {PowE E} 
   fun {$ N} 
      {Pow N E} 
   end 
end

fun {PowList L E} 
   {Applique L {PowE E}} 
end 

{Browse {PowList [1 2 3] 2}} 