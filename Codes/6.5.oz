declare
C= {NewCell nil}
L1 ={NewCell 0}|{NewCell 1}|{NewCell 2}| nil
L2 =0|{NewCell 1|{NewCell 2|C}}
% L1 est une liste de Cell
% L2 n ’ est pas une liste car ne termine pas par nil
% O (1)
fun {Prepend1 X L} X|L end % O(1)
fun {Prepend2 X L } X|{NewCell @L} end %O(1)
% pour ajouter la fin de L1 on utilise Append O(n)
% pour L2 O(n)
proc {Append2 L X}
   case L
   of _|T then {Append2 T X}
   else
      case @L
      of nil then L := X|{NewCell nil }
      [] _|C then {Append2 C X} end
   end
end
{Append2 L2 3}
{Browse @C}
declare
% both are unsafe , we need at least two elements
fun {Swap L } L.2.1|L.1|L.2.2 end
fun {Swap2 L} H T in
   H = (@(L.2)).1
   T = (@(L.2)).2
L.2 := L.1|T
H |L.2
end