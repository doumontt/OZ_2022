declare
fun {Sum N}
   {SumAux N 0}
end
fun {SumAux N I}
   if N==1 then I+1
   else {SumAux N-1 I+(N*N)} end
end
{Browse {Sum 6}}
   