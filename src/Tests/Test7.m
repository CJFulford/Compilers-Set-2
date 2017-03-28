% testing floor, float, and reals

data foot := #toe of foot | #ankle of foot;
fun func (x:foot):int
{ 
	var y:real;
	var z:real;
	
	y := 2.5;
	z := 7.2;

	return floor(y) + ceil(z);
};
