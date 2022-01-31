declare
class Collection
   attr elements
   meth init % initialise la collection
      elements:=nil
   end
   meth put(X) % insere X
      elements:=X|@elements
   end
   meth get($) % extrait un element et le renvoie
      case @elements of X|Xr then elements:=Xr X end
   end
   meth isEmpty($) % renvoie true ssi la collection est vide
      @elements==nil
   end
   meth union(C)
      if {Not {C isEmpty($)}} then
	 {self put({C get($)})}
	 {self union(C)}
      end
   end
   meth toList($)
      @elements
   end
end

declare
class SortedCollection from Collection
   meth put(X)
      fun {PutHelp L}
	 case L of H|T then
	    if H < X then H |{PutHelp T}
	    else X|L
	    end
	 [] nil then X|L
	 end
      end
   in
      elements :={PutHelp @elements}
   end
end
C1 = {New SortedCollection init}
C2 = {New Collection init}
{C1 put(0)}
{C1 put(1)}
{C2 put(2)}
{C2 put(1)}
{C2 put(3)}

{Browse {C1 toList($)}}
{Browse {C2 toList($)}}
{C1 union(C2)}
{Browse {C2 isEmpty($)}}
{Browse {C1 isEmpty($)}}
{Browse {C1 toList($)}}
{Browse {C1 get($)}}
{Browse {C1 toList($)}}

% if C1 , C2 are Collections , union is O (|C2|)
% because put is O (1)

% if C1 , C2 are SortedCollections ,
% union is O (|C2|^2 + |C1|*|C2|)

%proof :
%(n1 + (n1+1) + (n1+2) + ... + (n1+n2-1))
%~= (n1 + (n1+1) + (n1 +2) + ... + (n1+n2))
%= n2*n1 + (0+1+2+...+ n2)
% = n2*n1 + 0.5*n2*(n2+1)
% ~= n2*n1 + 0.5*n2*n2
% => O(n2^2 + n2*n1 )

declare
Xs = [7 8 0 4 3]
C3 = {New SortedCollection init}
for X in Xs do
   {C3 put(X)}
end
{Browse {C3 toList($)}}
% insertion sort O ( n ^2)