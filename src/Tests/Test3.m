% this test should fail
% this is a test for removal of items from a scopes

fun func(a:int):int
{
	var innerVar:int;
	
	begin
	return a * innerVar;
	end
};


begin
print func(innerVar);
end
