declare 
fun {MakeMulFilter N} 
   fun {$ I} 
      I mod N == 0 
   end 
end 

fun {Filter L F} 
   case L 
   of H|T then 
      if {F H} then H|{Filter T F} 
      else {Filter T F} 
      end 
   [] nil then nil 
   end 
end 

fun {EvenFilter L} 
   {Filter L {MakeMulFilter 2}} 
end 

fun {TripleFilter L} 
   {Filter L {MakeMulFilter 3}} 
end 

fun {IsPrime N} 
   fun {IsPrimeAcc N Acc} 
      if N =<1 then false 
      elseif N==Acc then true 
      else 
 if {{MakeMulFilter Acc} N} then false 
 else 
    {IsPrimeAcc N Acc+1} 
 end 
      end 
   end 
in 
   {IsPrimeAcc N 2} 
end 

 

fun {PrimeFilter L} 
   {Filter L IsPrime} 
end 

{Browse {PrimeFilter [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19]}} 