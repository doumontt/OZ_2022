declare
fun {NewStack}
   Stream
   proc {ParseStack S Stack}
      case S
      of push(X)|T then {ParseStack T X|Stack}
      [] pop(X)|T then X = Stack.1 {ParseStack T Stack.2}
      [] isEmpty(X)|T then X = (Stack == nil) {ParseStack T Stack}
      [] _|T then {ParseStack T Stack }
      else {Browse 'can t do that'}
      end
   end
in
   thread {ParseStack Stream nil} end
   {NewPort Stream}
end


proc {Push Port X}
   {Send Port push(X)}
end
fun {Pop Port}
   {Send Port pop($)}
end
fun {IsEmpty Port}
   {Send Port isEmpty($)}
end

MyStack = {NewStack}
{Push MyStack 'banane'}
{Browse {Pop MyStack}}
{Browse {IsEmpty MyStack}}
{Push MyStack 'kiwi'}
{Push MyStack 'fraise'}
{Browse {IsEmpty MyStack}}