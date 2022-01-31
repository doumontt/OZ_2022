declare
fun {Append L1 L2}
   case L1 of H|T then H|{Append T L2}
   [] nil then L2
   end
end
{Browse {Append [ateauB a] [p h]}}