declare 
fun {Reduct L F Acc} 
   case L 
   of H|T then {Reduct T F {F H Acc}} 
   else Acc 
   end 
end 

 

fun {MultList L} 
   {Reduct L fun{$ X Y} X*Y end 1} 
end 

fun {DiffList L} 
   {Reduct L fun{$ X Y} Y-X end 0} 
end 

 

{Browse {MultList [1 2 3 4]}} 

{Browse {DiffList [1 2 3 4]}} 