declare
fun {Matching L}
   case L of nil then empty
   [] H|T then nonEmpty
   else other
   end
end

{Browse {Matching banane}}
fun {Head L}
   case L
   of H|T then H
   [] nil then nil
   end
end
{Browse {Head 12|15|nil}}