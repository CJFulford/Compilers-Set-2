% testing conditionals

data foot := #toe of foot | #ankle of foot;
fun func (x:foot):int
{ 
	var w:bool;
	var x:bool;
	var y:int;
	var z:int;
	
	w := false;
	x := true;
	y := 5;
	z := 4;
	
	if ((y =< z) && w)
	then
	{
		w := false;
	}
	else
	{
		w := true;
	};
	
	if (y > z || x || w)
	then
	{
		y := y - 5;
	}
	else
	{
		z := z + 200;
	};
	
	return y + z;
};
