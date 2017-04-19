% testing accessing a variable several levels outside of the scope

var x:int;

fun outer(a:int):int
{ 
	fun middle(a:int):int
	{
		fun inner(a:int):int
		{
			begin
			return x * (1 / 2) - a;
			end
		};
		
		var y:int;
		
		begin
		y := inner(a);
		
		if (x =< y)
		then y := x * x
		else y := x - 2;
		return y;
		end
	};
	
	var ret:int;
	
	begin
	if (x =< 5)
	then ret := x + middle(a)
	else ret := x - middle(a);
	return ret;
	end
};

begin
read x;
print outer(x);
end
