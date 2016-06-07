module easing;

import easing.functions;

pure T map(alias F = linear, T, Options ...)(in T v, in T minIn, in T maxIn, in T minOut, in T maxOut, Options options){
	T time = v - minIn;
	T change = maxOut - minOut;
	T duration = maxIn - minIn;
	T begin = minOut;
	
	return F(time, begin, duration, change, options);
}
unittest{
	assert(0.0.map!linear(0.0, 10.0, 0.0, 1.0) == 0.0);
	assert(5.0.map!linear(0.0, 10.0, 0.0, 1.0) == 0.5);
	assert(10.0.map!linear(0.0, 10.0, 0.0, 1.0) == 1.0);
	
	assert(0.0.map!(quad.easeIn)(0.0, 10.0, 0.0, 1.0) == 0.0);
	assert(0.0.map!easeInQuad(0.0, 10.0, 0.0, 1.0) == 0.0);
	// assert(5.0.map!quad(0.0, 10.0, 0.0, 1.0) == 0.25);
	// assert(10.0.map!quad(0.0, 10.0, 0.0, 1.0) == 1.0);
}

pure T clamp(T)(in T v, in T min, in T max){
	if (v < min) {
		return min;
	}else if(max < v){
		return max;
	}else{
		return v;
	}
}
unittest{
	assert(10.clamp(-1, 2) == 2);
	assert((-10).clamp(-1, 2) == -1);
}

