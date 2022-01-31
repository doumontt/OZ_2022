declare 
fun {NewStack} 
   {NewCell nil} 
end 

fun {IsEmpty S} 
   @S == nil 
end 

proc {Push S X} 
   S := X|@S 
end 

fun {Pop S} 
   if {IsEmpty S} then nil 
   else R in 
      R = @S.1 
      S := @S.2 
      R 
   end 
end 

fun {Eval Xs} 
   S = {NewStack} 
in 
   for X in Xs do 
      case X 
      of '+' then 
	 {Push S {Pop S} + {Pop S}} 
      [] '-' then Op1 Op2 in 
	 Op1 = {Pop S} 
	 Op2 = {Pop S} 
	 {Push S Op2 - Op1} 
      [] '*' then 
	 {Push S {Pop S} * {Pop S}} 
      [] '/' then Op1 Op2 in 
	 Op1 = {Pop S} 
	 Op2 = {Pop S} 
	 {Push S Op2 div Op1} 
      [] N then {Push S N}
      end 
   end 
   {Pop S} 
end 

 

{Browse {Eval [13 45 '+' 89 17 '-' '*']}} % affiche 4176 = (13+45)*(89-17) 

{Browse {Eval [13 45 '+' 89 '*' 17 '-']}} % affiche 5145 = ((13+45)*89)-17 

{Browse {Eval [13 45 89 17 '-' '+' '*']}} % affiche 1521 