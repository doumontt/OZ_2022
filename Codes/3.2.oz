%[1] - > ’| ’(1:1 2: nil )
%[1 2 3] - > ’| ’(1:1 2: ’| ’(1:2 2: ’| ’(1:3 2: nil ) ) )
% nil - > nil
% state (4 f 3) -> state (1:4 2:f 3:3)
{Browse '|'(1:1 2:nil )}
{Browse '|'(1:1 2:'|'(1:2 2:'|'(1:3 2:nil)))}
{Browse nil}
{Browse state(1:4 2:f 3:3)}			
			