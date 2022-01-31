declare
L3=proc{$}{Browse oui}end|proc{$}{Browse non}end|nil
L1 = a | nil 
L2 = a| (b | c | nil ) | d | nil
L4 = est | une | liste | nil
L5 = (a | p | nil) | nil
{L3.1}
{Browse L1}
{Browse L2}
{Browse L3}
{Browse L4}
{Browse L5}
L6 = ceci | L4
{Browse L6}
{L3.1}
{Browse L2.2}
L7= L2.2
{Browse L7}
fun {Head N}
   N.1
end
fun {Tail N}
   N.2
end
{Browse {Head L7}}
{Browse {Tail L7}}