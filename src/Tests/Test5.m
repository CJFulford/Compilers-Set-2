% testing Case statements

data foot := #toe of foot | #ankle of foot;
fun func (x:foot):int
{ 
	var f:int;
	
	% test case
	case (x) of
	{
		#toe (x) => f := 1
		| #ankle (x) => f := 0
	};
	return f;
};
