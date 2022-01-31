declare
%proc {Q A} {P A+1} end %Ec -> {P->p}
%proc {P} {Browse A } end %---> E_c = {Browse -> browse }
local P Q in
   proc {P A R} R=A+2 end %E_c= {}
   local P R in
      fun{Q A} %Ec={P->p}
	 {P A R}
	 R
      end
      proc {P A R} R=A-2 end %E_c = {}
   end
{Browse {Q 4}}
end
