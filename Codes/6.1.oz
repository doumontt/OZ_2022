declare
fun {Reverse Xs}
   fun {ReverseAux Xs Ys}
      case Xs of nil then Ys
      [] X|Xr then {ReverseAux Xr X|Ys}
      end
   end
in
   {ReverseAux Xs nil}
end


fun {Reverse2 Xs}
   
   local C in
      C = {NewCell nil}
      for X in Xs do
	 C := X | @C
      end
      @C
   end
end
{Browse {Reverse2 [1 2 3 4 5 6 7 8 9]}}

% Identique en terme d’appels rec
% L’etat n’est pas encapsule! Il y a une Cell Y
% Xs est une liste (immutable), il ne peut pas changer !