declare

fun {MakeBinaryGate F}
   fun {$ S1 S2}
      fun {Gate SA SB}
	 case SA#SB
	 of (HA|TA)#(HB|TB) then
	    {F HA HB}|{Gate TA TB}
	 else
	    nil
	 end
      end
   in
      thread {Gate S1 S2} end
   end
end



And = {MakeBinaryGate fun {$ A B} A*B end}
Or = {MakeBinaryGate fun {$ A B} A+B-A*B end}
Nand={GateMaker fun {$ X Y} 1-X*Y end}
Nor={GateMaker fun {$ X Y} 1-X-Y+X*Y end}
Xor={GateMaker fun {$ X Y} X+Y-2*X*Y end}
S1 = 0|0|1|1|_
S2 = 0|1|0|1|_

   
