{Browse {IsTuple '|'(a b)}} %->true, not a list 

{Browse {IsTuple state(1 a 2)}} %->true, not a list 

{Browse {IsTuple a#b#c}} %->true 

{Browse {IsList '|'(a '|'(b nil))}} %->true 

{Browse {IsTuple state(1 3:2 2:a)}} %->true, not a list, even if fields not in order 

{Browse {IsList [a b c]}} %->true 

{Browse {IsList '|'(2:nil a)}} %->true 

{Browse {IsTuple tree(v:a b c)}} %->false, it is a record 

{Browse {IsTuple m|n|o}}%->true, not a list