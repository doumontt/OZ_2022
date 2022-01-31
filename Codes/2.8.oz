declare
fun { Prefix L1 L2 }
   case L1 of H1 | T1 then
      case L2 of H2 | T2 then
	 if H1 == H2 then { Prefix T1 T2 }
	 else false
	 end
      [] nil then false
      end
   [] nil then true
   end
end

fun { FindString S T }
   local IndexMax FindStringHelp
      IndexMax = { Length T } -{ Length S }+1
      FindStringHelp =
      fun { $ L1 L2 I }
	 if I = < IndexMax then
% !!!!!! = < et PAS <=
	    if { Prefix L1 L2 } then
	       I |{ FindStringHelp L1 L2.2 I+1}
	    else { FindStringHelp L1 L2.2 I+1}
	    end
	 else nil
	 end
      end
   in
      { FindStringHelp S T 1}
   end
end