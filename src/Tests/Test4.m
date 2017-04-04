% testing while statements
fun exp(b:int):int
{ 
	var x:int;
	var z:int;
	
    begin
	x := 0;
	z := 5;
	
	
	% test the shile loop
	while (x < z) do
	{
        begin
		x := x + 1;
        end
	};
	
	
	
	
	return z;
    end
};

var x:int;
begin
read x;
print exp(x);
end
