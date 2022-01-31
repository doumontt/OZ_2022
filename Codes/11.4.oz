declare
proc {NewPortObject Init Fun ?P}
   proc {MsgLoop S1 State }
      case S1 of Msg|S2 then
	 {MsgLoop S2 {Fun Msg State}}
      [] nil then skip end
   end
   Sin
in
   thread {MsgLoop Sin Init} end
   {NewPort Sin P}
end

proc {NewPortObject2 Proc ?P }
   Sin in
   thread
      for Msg in Sin do
	 {Proc Msg}
      end
   end
   {NewPort Sin P }
end

proc {Floor Num Init Lifts ?Fid}
   {NewPortObject Init
    fun {$ Msg state(Called)}
	case Msg
	of call then
	   {Browse 'Floor'#Num#'calls a lift ! '}
	   if {Not Called} then
	      Lran in
	      Lran = Lifts.(1+{OS.rand } mod {Width Lifts})
	      {Send Lran call(Num)}
	   end
	   state(true)
	[] arrive(Ack) then
	   {Browse 'Lift at floor '#Num#': open doors'}
	   {Delay 2000}
	   {Browse 'Lift at floor '#Num# ': close doors '}
	   Ack = unit
	   state(false)
	end
     end
     Fid}
end
proc {Lift Num Init Cid Floors ?Lid}
   fun {Controller Dest state(Pos Sched)}
      NewPos in
      if Pos<Dest then
	 {Delay 1000} NewPos = Pos +1
      elseif Pos > Dest then
	 {Delay 1000} NewPos = Pos -1
      end
      state(NewPos Sched)
   end
   fun {Scheduler state(Pos Sched)}
      {Browse 'Lift '#Num # 'at floor '#Pos }
      case Sched
      of S|Sched2 then
	 if Pos == S then
	    {Wait {Send Floors.S arrive($)}}
	    if Sched2 == nil then
	       state(Pos nil)
	    else
	       {Scheduler {Controller Sched2.1 state(Pos Sched2)}}
	    end
	 else
	    {Scheduler {Controller S state(Pos Sched) }}
	 end
      else
	 state(Pos Sched)
      end
   end
in
   {NewPortObject Init
     fun {$ Msg state(Pos Sched)}
	case Msg
	of call(N) then
	   {Browse 'Lift '# Num # ' needed at floor'# N }
	   if N == Pos andthen {Not Moving } then
	      {Wait {Send Floors.Pos arrive($)}}
	      state(Pos Sched)
	   else
	      NewSched NewState in
	      NewSched = {Append Sched [N]}
	      {Scheduler state(Pos NewSched)}
	   end
	end
     end
     Lid }
end
proc {Building FN LN ?Floors ?Lifts }
   Lifts ={MakeTuple lifts LN }
   for I in 1.. LN do C in
      {Controller C }
      Lifts.I ={Lift I state(1 nil false) C Floors}
   end
   Floors ={MakeTuple floors FN }
   for I in 1.. FN do
      Floors.I ={Floor I state(false) Lifts }
   end
end