declare
fun {Length N}
   fun {LengthAcc N A}
      case N of H|T then {LengthAcc T A+1}
      [] nil then A
      end
   end
in
   {LengthAcc N 0}
end
{Browse {Length a|b|c|nil}}
