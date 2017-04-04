% testing conditionals
fun func (x:int):int
{ 
	var w:bool;
	var x:bool;
	var y:int;
	var z:int;
	
    begin
	w := false;
	x := true;
	y := 5;
	z := 4;
	
	if (y =< z)
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
    end
};

var x:int
begin
read x;
print func(x);
end

