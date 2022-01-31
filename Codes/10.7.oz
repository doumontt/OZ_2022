declare 
fun {Counter Output} 
   Str 
   fun {CounterLoop S State} 
      case S 
      of H|T then 
	 Y in 
	 Y = {UpdatedList State H} 
	 Y|{CounterLoop T Y} 
      else nil 
      end 
   end
   
   fun {UpdatedList OldList Elem} 
      case OldList 
      of nil then (Elem#1)|nil 
      [] H|T then 
	 case H 
	 of Ch#Co then 
	    if Ch==Elem then (Ch#(Co+1))|T 
	    else H|{UpdatedList T Elem} 
	    end 
	 else nil 
	 end 
      end 
   end 
in 
   thread Output = {CounterLoop Str nil} end 
   {NewPort Str} 
end 



Output 
P = {Counter Output}
{Browse Output} 
{Send P a} 
{Send P b} 
{Send P a} 
