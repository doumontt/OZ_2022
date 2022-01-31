declare
fun {DictionnaryFilter D F}
   case D of dict(key: Key info: Info left: Left right: Right) then
	    if {F D.info } then Key # Info |{DictionaryFilter Left F}|{DictionnaryFilter Right F}
	    else {DictionaryFilter Left F}|{DictionaryFilter Right F}
	    end
	 [] leaf then nil
   end
end

   
local Old Class in
Class = dict(key:10
	     info:person('Christian' 19)
	     left:dict(key:7
		       info:person('Denys' 25)
		       left:leaf
		       right:dict(key:9
				  info:person('David' 7)
				  left:leaf
				  right:leaf))leaf
	     right:dict(key:18
			info:person('Rose' 12)
			left:dict(key:14
				  info:person('Ann' 27)
				  left:leaf
				  right:leaf)
			right:leaf))
fun {Old Info}
   Info.2 > 20
end
% Val --> [7#person('Denys' 25) 14#person('Ann' 27)]
{Browse {DictionaryFilter Class Old }}
end