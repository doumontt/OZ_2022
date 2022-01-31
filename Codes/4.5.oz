declare
fun {Convertir T V}
   T*V
end
fun {ConvertirBetter T}
   fun {$ V}
      T*V
   end
end
fun {ConvertirBetter2 A B}
   fun {$ V}
      A*V+B
   end
end


A = {ConvertirBetter 2}
B = {ConvertirBetter2 2 1}
{Browse {A 3}}
{Browse {B 3}}

