declare

fun {PromenadeSoluce Bt}
   case Bt of btree(V left: LT right: RT) then
      V| {PromenadeSoluce LT}| {PromenadeSoluce RT}
   [] empty then nil
   end
end



fun {FoldL L F U }
   case L of nil then U
   [] H | T then {FoldL T F { F U H }}
   end
end

fun {SumTree Bt }
   local L Sum
      L = {PromenadeSoluce Bt }
      Sum =
      fun {$ Lst Tot }
	 case Lst of H | T then {Sum T Tot + H }
	 [] nil then Tot
	 end
      end
   in
      {Sum L 0}
   end
end

Btree = btree(42
	       left: btree(26
			     left : btree(54
					   left : empty
					   right : btree(18
							  left : empty
							  right : empty ))
			     right : empty )
	       right : btree(37
			      left : btree(11
					    left : empty
					    right : empty )
			      right : empty ))
{Browse {PromenadeSoluce Btree }}
{Browse {FoldL [1 2 3 4 5 6 7 8 9] fun { $ X Y } X + Y end 0}}
{Browse {SumTree Btree }}