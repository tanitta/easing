module easing.functions;

pure T linear(T)(in T time, in T begin, in T duration, in T change){
	return change/duration * time + begin;
}


pure T quad(T)(in T time, in T begin, in T duration, in T change){
	immutable divTimeByDuration = time/duration; 
	return change * divTimeByDuration^^2 + begin;
}
