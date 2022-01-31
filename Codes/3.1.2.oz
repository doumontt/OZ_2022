declare
fun {SumAux N Acc }
   if N == 1 then Acc+1
   else {SumAux N-1 N*N+Acc} end
end
fun {Sum N}
   {SumAux N 0}
end

declare KernelSumAux KernelSum A in
proc {KernelSumAux N Acc ?R}
   local One B1 in
      One = 1
      B1 = N ==1
      if B1 then R = Acc +1
      else
	 local N1 B2 B3 in
	    N1 = N -1
	    B2 = N*N
	    B3 = B2 + Acc
	    {KernelSumAux N1 B3 R}
	 end
      end
   end
end
proc {KernelSum N ?R}
   local Zero in
      Zero = 0
      {KernelSumAux N Zero R}
   end
end
{KernelSum 9 A}
{Browse A}