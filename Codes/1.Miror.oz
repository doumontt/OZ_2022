declare
fun {Miror N}
   {MirorAux N 0}
end
fun {MirorAux N I}
   if N==0 then I
   else {MirorAux (N div 10) I*10+N mod 10} end
   end

	
{Browse {Miror 146587234}}
