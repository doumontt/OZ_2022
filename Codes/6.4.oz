declare 

fun {Shuffle L} I A B Li Picked in 
   I = {NewCell 0} 
   A = {NewArray 0 {Length L} 0} 
   for X in L do 
      A.@I := X 
      I := @I +1 
   end 
   Picked = {NewCell 0} 
   B = {NewArray 0 {Length L} 0} 
   for N in 0..({Length L}-1) do R in 
      R = {OS.rand} mod ({Length L} -N) 
      {Browse R} 
      Picked := A.R 
      B.N :=@Picked 
      A.R := A.({Length L}-N-1) 
   end 
   Li = {NewCell nil} 
   for Ind in 0..({Length L}-1) do 
      Li :=(B.({Length L}-1-Ind))|@Li 
   end 
   @Li 
end 

 
{Browse {Shuffle [a b c d e]}}

%%% Les indications dans l'énoncé sont un peu mauvaises. 

%%% {NewArray I J 0} a des indices de I à J-1, donc sa longueur est J-I-1. 

%%% {OS.rand} mod N+1 rend un nombre de 0 à N. 

%%% Les indices d'un array peuvent commencer à 0. 