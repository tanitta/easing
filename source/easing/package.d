module easing;

import easing.functions;

pure T map(alias F = linear, T)(in T v1, in T minIn, in T maxIn, in T minOut, in T maxOut, bool isClamp = true){
	T epsilon;
	static if(is(T == int)){
		epsilon = 0;
	}else{
		epsilon = T.epsilon;
	}
	import std.math;
	if(( maxIn - minIn ).abs <= epsilon){
		return minOut;
	}else{
		if(isClamp){
			return clamp( (v1 - minIn) / (maxIn - minIn) * (maxOut - minOut) + minOut, minOut, maxOut);
		}else{
			return (v1 - minIn) / (maxIn - minIn) * (maxOut - minOut) + minOut;
		}
	}
}
unittest{
	assert(0.0.map!linear(0.0, 10.0, 0.0, 1.0) == 0.0);
	assert(10.0.map!linear(0.0, 10.0, 0.0, 1.0) == 1.0);
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

