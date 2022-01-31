declare R
fun {MakeBinaryGate F}
   proc {$ S1 S2 R}
      fun {Gate SA SB}
	 case SA#SB
	 of (HA|TA)#(HB|TB) then
	    {F HA HB}|{Gate TA TB}
	 else
	    nil
	 end
      end
   in
      thread R = {Gate S1 S2} end
   end
end

And = {MakeBinaryGate fun {$ A B} A*B end}
Or = {MakeBinaryGate fun {$ A B} A+B-A*B end}
Nand={MakeBinaryGate fun {$ X Y} 1-X*Y end}
Nor={MakeBinaryGate fun {$ X Y} 1-X-Y+X*Y end}
Xor={MakeBinaryGate fun {$ X Y} X+Y-2*X*Y end}
S1 = 0|0|1|1|_
S2 = 0|1|0|1|_
{And S1 S2 R}

%Chaque fonction attend l'autre, donc ca marche pas, il faut ajouter un délai.
local R=1|1|1|0|_ S=0|1|0|0|_ Q NotQ
   fun {Delay S}
      0|S
   end
  

   proc {Bascule Rs Ss Qs NotQs}
      DelayedQs = {Delay Qs}
      DelayedNotQs = {Delay NotQs}
   in
      {Nor Rs DelayedNotQs Qs}
      {Nor Ss DelayedQs NotQs}
   end
in
   {Bascule R S Q NotQ}
   {Browse Q#NotQ}
end