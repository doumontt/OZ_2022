local X Y Z in
   {Browse [X Y Z]}
   thread if X==1 then Y=2 else Z=2 end end
   {Browse [X Y Z]}
   thread if Y==1 then X=1 else Z=2 end end
   {Browse [X Y Z]}
   X=1
   {Browse [X Y Z]}
end

%Second code

local X Y Z in
      {Browse [X Y Z]}

   thread if X==1 then Y=2 else Z=2 end end
   thread if Y==1 then X=1 else Z=2 end end
   X=2
end