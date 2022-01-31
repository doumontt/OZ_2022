declare
fun {Sum N}
   if N == 1 then 1
   else N*N + {Sum N-1} end
end
{Browse {Sum 9}}
declare SumKernel in
proc {SumKernel N ?R}
   local B One in
      One = 1
      B= (N == One)
      if B then
	 R = 1
      else
	 local R1 N1 P in
	    N1= N-One
	    P= N*N
	    {SumKernel N1 R1}
	    R = P + R1
	 end

      end
   end
end
declare
R
{SumKernel 9 R}
{Browse R}