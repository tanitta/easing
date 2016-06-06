module easing.functions;

pure T linear(T)(in T time, in T begin, in T duration, in T change){
	return change/duration * time + begin;
}
