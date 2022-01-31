declare
fun {Applique L F}
   case L of H|T then {F H}|{Applique T F}
   [] nil then nil
   end
end
fun {Lol X} lol(X) end
{Browse {Applique [1 2 3] Lol}}
fun {MakeAdder N}
   fun{$ X}
      X+N
   end
end
Add5= {MakeAdder 5}
{Browse {Add5 13}}
fun {AddAll L N}
   local Add in
   Add = {MakeAdder N}
      {Applique L Add}
   end
   
end
{Browse {AddAll [1 2 3] 4}}
