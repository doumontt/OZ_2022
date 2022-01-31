local Y LB in
   Y=10
   proc {LB X ?Z}
      if X>=Y then Z=X
      else Z=Y end
   end
   local Y=15 Z in
      {LB 5 Z}
      {Browse Z}
   end
end