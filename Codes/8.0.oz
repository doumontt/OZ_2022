declare
fun {NewStack}
    C = {NewCell nil}
    fun {IsEmpty} @C==nil end
    proc {Push X} C:=X|@C end
    fun {Pop}
        case @C of nil then nil
        [] H|T then C:=T H 
        end
    end
in
    stack(push:Push pop:Pop isEmpty:IsEmpty)
end

fun {Eval Xs}
    C = {NewStack} in
    for X in Xs do
        case X of '+' then
            {C.push {C.pop} + {C.pop}}
        [] '-' then Op1 Op2 in
            Op1 = {C.pop}
            Op2 = {C.pop}
            {C.push Op2 - Op1}
        [] '*' then
            {C.push {C.pop} * {C.pop}}
        [] '/' then Op1 Op2 in
            Op1 = {C.pop}
            Op2 = {C.pop}
            {C.push Op2 div Op1}
        [] N then 
            {C.push N}
        end
    end
    {C.pop} 
end
{Browse {Eval [13 45 '+' 89 17 '-' '*']}}

%Ici l'abstraction de donnée est un objet, il existe également l'abstract data type ainsi que l'"Abstract data types with state (stateful ADTs) et Objects without state (functional objects) qui sont discutés plus en détails dans le cours.