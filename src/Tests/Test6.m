% this test should fail.
% and testing for a funciton as an argument

var i:int;
var b:bool;

fun func(x:int, y:bool):int
{
	var z:int;
	
	begin
	if y
	then z := x
	else z := -x;
	return z; 
	end
};

begin

read i;
read b;

print func(func(i, b), b);

end
