declare 

fun {Barman N} 
   {Delay 3000} 
   if N == 0 then nil 
   else 
      if {OS.rand} mod 2 == 1 then trappist|{Barman N-1} 
      else pils|{Barman N-1} 
      end 
   end 
end 

%hoih 
declare 
fun {Charlotte Str Acc Count} 
   fun {SmellTrappist Beer} 
      Beer == trappist 
   end 
in 
   case Str 
   of nil then Count = Acc nil 
   [] H|T then 
      if {SmellTrappist H} then 
	 {Charlotte T Acc+1 Count} 
      else 
	 H|{Charlotte T Acc Count} 
      end 
   end 
end 

declare 
fun {Friend Str Count} 
   case Str 
   of nil then Count 
   [] H|T then {Friend T Count+1} 
   end 
end 


local Bar Cha Fr C in 
thread Bar = {Barman 5} end 
thread Cha = {Charlotte Bar 0 C} end 
thread Fr = {Friend Cha 0} end 
{Browse C#Fr} 
end 