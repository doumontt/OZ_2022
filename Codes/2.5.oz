declare
fun {Take Xs N}
   case Xs of H|T then
      if N>0 then H|{Take T N-1}
      else nil end
      [] nil then nil
   end
end
{Browse {Take a|b|nil 7}}

fun {Drop Xs N}
   case Xs of H|T then
      if N>0 then {Drop T N-1}
      else Xs
      end
   [] nil then nil
   end
end
{Browse {Drop a|b|nil 1}}

   
