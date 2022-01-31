declare 

fun {NewQueue} 
   proc {Loop S State} 
      case S 
      of H|T then 
	 case H 
	 of enqueue(X) then {Loop T {List.reverse X|State}}
	 [] dequeue(N) then 
	    case State 
	    of nil then N = none {Loop T State} 
	    [] M|B then N = M {Loop T B} 
	    end 
	 [] isEmpty(B) then B = (State == nil) {Loop T State} 
	 end 
      else skip 
      end 
   end 
   Str 
in 
   thread {Loop Str nil} end 
   {NewPort Str} 
end 

proc {Enqueue S X} 
   {Send S enqueue(X)} 
end 
fun {Dequeue S} 
   {Send S dequeue($)} 
end 
fun {IsEmpty S} 
   {Send S isEmpty($)} 
end 
 
Q = {NewQueue} 
{Enqueue Q 13} 
{Browse {Dequeue Q}} 
{Browse {Dequeue Q}}