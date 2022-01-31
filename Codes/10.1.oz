declare
P S
{NewPort S P}
{Send P foo}
{Send P bar}
{Browse S}
proc {PrintMsg S}
   case S
   of H|T then {Browse H} {PrintMsg T}
   else skip
   end
end
{PrintMsg S}