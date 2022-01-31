declare
proc {Countdown N}
   if N == 0 then {Browse 0}
   else {Browse N} {Countdown (N-1)}
   end
end
{Countdown 5}