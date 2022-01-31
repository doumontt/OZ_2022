declare
N
fun {NewPortObject Behaviour Init}
   proc {MsgLoop S1 State}
      case S1 of Msg|S2 then
	 {MsgLoop S2 {Behaviour Msg State}}
      [] nil then skip
      end
   end
   Sin
in
   thread {MsgLoop Sin Init} end
   {NewPort Sin}
end

fun {Behaviour Str State}
   case Str 
   of getCount(N) then N=State State
   [] getIn(N) then N+State
   [] getOut(N) then State-N 
   end 
end


fun {Portier2 Init}
   {NewPortObject Behaviour Init}
end






fun {Portier Init} 
   proc {Loop Str State} 
      case Str 
      of S1|Sr then 
	 case S1 
	 of getCount(N) then N = State {Loop Sr State} 
	 [] getIn(N) then {Loop Sr State+N} 
	 [] getOut(N) then {Loop Sr State-N} 
	 end 
      end 
   end 
   Stre 
in 
   thread {Loop Stre Init} end 
   {NewPort Stre} 
end 

 

Por = {Portier2 8} 

{Send Por getIn(9)} 

{Browse {Send Por getCount(N)}} 