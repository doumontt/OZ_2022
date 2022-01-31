declare 
fun {NotGate Xs} 
   fun {Not X} 
      1-X 
   end 
   fun {GateLoop F Xs} 
      case Xs 
      of X|Xr then {F X}|{GateLoop F Xr} 
      else nil 
      end 
   end 
in 
   thread {GateLoop Not Xs} end 
end 

fun {AndGate Xs Ys} 
   fun {And X Y} 
      X*Y 
   end 
   fun {GateLoop Xs Ys} 
      case Xs#Ys 
      of (X|Xr)#(Y|Yr) then {And X Y}|{AndGate Xr Yr} 
      end 
   end 
in 
   thread {GateLoop Xs Ys} end 
end 

fun {OrGate Xs Ys} 
   fun {Or X Y} 
      X+Y - X*Y 
   end 
   fun {GateLoop Xs Ys} 
      case Xs#Ys 
      of (X|Xr)#(Y|Yr) then {Or X Y}|{OrGate Xr Yr} 
      else nil 
      end 
   end 
in 
   thread {GateLoop Xs Ys} end 
end 
 

local S in 
   S = 0|1|0|0|1|0|nil
   Q = 1|0|0|0|1|0|0|_ 
   {Browse {OrGate S Q}} 
end 

 

 

declare 

fun {Simulate G Ss} 

   case G 

   of input(x) then Ss.x 

   [] input(y) then Ss.y 

   [] input(z) then Ss.z  

   else 

      case G.value 

      of 'or' then 

 thread {OrGate {Simulate G.1 Ss} {Simulate G.2 Ss}}end 

      [] 'and' then 

 thread {AndGate {Simulate G.1 Ss} {Simulate G.2 Ss}} end 

      [] 'not' then 

 thread {NotGate {Simulate G.1 Ss}} end 

      end 

   end 

end 

 

declare G Ss in 

G = gate(value:'or' 

 gate(value:'and' 

      input(x) 

      input(y)) 

gate(value:'not' input(z))) 

{Browse {Simulate G Ss}} 

Ss = input(x:1|0|1|0|_ y: 0|1|0|1|_ z:1|1|0|0|_) 