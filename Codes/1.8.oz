local P Q X Y Z in  %(1) 
   local Y in 
      Y = X 
      fun {P X} 
	 X*Y+Z         %(2)
      end 

   end 

   fun {Q Y} 

      X*Y+Z         %(3) 

   end 

   X=1 

   Y=2 

   Z=3 

   {Browse {P 4}} 

   {Browse {Q 4}} 

   {Browse {Q {P 4}}} %(4) 

end 

 