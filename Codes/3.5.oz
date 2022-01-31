local MakeAdd Add1 Add2 in
   proc {MakeAdd X Add}
      proc {Add Y Z}
	 Z=X+Y
      end
   end
   {MakeAdd 1 Add1}
   {MakeAdd 2 Add2}
   local V in
      {Add1 42 V} {Browse V}
   end
   local V in
      {Add2 42 V} {Browse V}
   end
end