declare 

fun {LaunchServer} 
   S
   P
   proc {ReceiveMessage Str} 
      case Str 
      of H|T then 
	 case H 
	 of add(X Y R) then R = X+Y 
	 [] pow(X Y R) then R = {Pow X Y}
	 [] 'div'(X Y R) then
	    if Y==0 then  R=0 else
	       R = X div Y end
	 else {Browse 'je ne comprends pas ton message'} 
	 end
	 {ReceiveMessage T} 

      else skip 
      end 
   end      
in
   P = {NewPort S}
   thread {ReceiveMessage S} end 
   P
end 

%Le code de test
declare A B N S Res1 Res2 Res3 Res4 Res5 Res6 R 
S = {LaunchServer} 
{Send S add(321 345 Res1)} 
{Browse Res1} 

{Send S pow(2 N Res2)} 
{Browse Res2}
N = 8 

{Send S add(A B Res3)} 
{Send S add(10 20 Res4)} 
{Send S foo} 
{Browse Res4} 
A = 3 
B = 0-3
{Send S 'div'(90 Res3 Res5)} 
{Send S 'div'(90 Res4 Res6)} 
{Browse Res3} 
{Browse Res5} 
{Browse Res6} 