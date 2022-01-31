declare 
fun {NewStack} 
   C 
   fun {IsEmpty} 
      @C == nil 
   end
   
   proc {Push X} 
      C := X|@C 
   end 

   fun {Pop} 
      if {IsEmpty} then nil 
      else 
	 R in 
	 R = @C.1 
	 C := @C.2 
	 R 
      end 
   end 
in 
   C = {NewCell nil} 
   stack(isEmpty:IsEmpty push:Push pop:Pop) 
end 

 

fun {Eval L} 
   S = {NewStack} 
in 
   for I in L do 
      case I 
      of '+' then {S.push {S.pop}+{S.pop}} 
      [] '-' then Op1 Op2 in 
	 Op1 = {S.pop} 
	 Op2 = {S.pop} 

	 {S.push Op2-Op1} 

      [] '*' then {S.push {S.pop}*{S.pop}} 

      [] '/' then Op1 Op2 in 

	 Op1 = {S.pop} 
	 Op2 = {S.pop} 

	 {S.push Op2 / Op1} 

      [] N then {S.push N} 
      end 
   end 
   {S.pop} 
end 

 

{Browse {Eval [13 45 '+' 89 17 '-' '*']}} 

 

% Il s'agit d'un objet (représenté par un record) car valeurs et opérations sont regroupées. On aurait pu faire un Abstract Data Type. 