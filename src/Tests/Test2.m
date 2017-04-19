% test for properly getting the level of a variable

var x:int;
var z:bool;
fun f(x:int, z:bool):int
{
    var y:int;
    
    begin
		if (z)
		then y := x * x * x
		else y := x * x;
		return y;
    end
};
begin
read x;
read z;
print f(x, z);
end


