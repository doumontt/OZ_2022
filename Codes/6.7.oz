declare
class Constante
   attr value
   meth init(V) value := V end
   meth evalue($) @value end
   meth derive(V $) {New Constante init(0)} end
end
class Variable
   attr value
   meth init(V) value := V end
   meth evalue($) @value end
   meth derive(V E)
      if self == V then E = {New Constante init(1)}
      else E = {New Constante init(0)} end
   end
   meth set(V) value := V end
end
class Somme
   attr e1 e2
   meth init(Expr1 Expr2)
      e1 := Expr1
      e2 := Expr2
   end
   meth evalue($) {@e1 evalue($)} + {@e2 evalue($)} end
   meth derive(V $)
      {New Somme init({@e1 derive(V $)} {@e2 derive(V $)})}
   end
end
class Difference
   attr e1 e2
   meth init(Expr1 Expr2)
      e1 := Expr1
      e2 := Expr2
   end
   meth evalue($){@e1 evalue($)} - {@e2 evalue($)} end
   meth derive(V $)
      {New Difference init({@e1 derive(V $)} {@e2 derive(V $)}) }
   end
end
class Produit
   attr e1 e2
   meth init(Expr1 Expr2)
      e1 := Expr1
      e2 := Expr2
   end
   meth evalue($) {@e1 evalue($)} * {@e2 evalue($) } end
   meth derive(V $) D1 D2 in
      D1 = {New Produit init({@e1 derive(V $)} @e2)}
      D2 = {New Produit init({@e2 derive(V $) } @e1 ) }
      {New Somme init(D1 D2) }
   end
end
class Puissance
   attr e1 c
   meth init(Expr1 C)
      e1 := Expr1
      c := C
   end
   meth evalue($) {Pow {@e1 evalue($)}@c } end
   meth derive(V $) De1 P CP in
      De1 = {@e1 derive(V $)}
      P = {New Puissance init(@e1 @c -1)}
      CP ={New Produit init({ New Constante init(@c)} P)}
      {New Produit init(CP De1)}
   end
end
declare
VarX ={New Variable init(0)}
VarY ={New Variable init(0)}
local
   ExprX2 ={New Puissance init(VarX 2) }
   Expr3 ={New Constante init(3) }
   Expr3X2 ={New Produit init(Expr3 ExprX2) }
   ExprXY ={New Produit init(VarX VarY) }
   Expr3X2mXY ={New Difference init(Expr3X2 ExprXY)}
   ExprY3 ={New Puissance init(VarY 3)}
in
   Formule ={New Somme init(Expr3X2mXY ExprY3)}
end
{VarX set(7)}
{VarY set(23)}
{Browse {Formule evalue($) }} % affiche 12153
{VarX set(5)}
{VarY set(8)}
{Browse {Formule evalue($)}} % affiche 547
declare
Derivee ={Formule derive(VarX $) } % represente 6 x - y
{VarX set(7)}
{VarY set(23)}
{Browse {Derivee evalue($)}} % affiche 19