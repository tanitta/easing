module easing.functions;

pure T linear(T)(in T time, in T begin, in T duration, in T change){
	return change/duration * time + begin;
}


// pure T quad(T)(in T time, in T begin, in T duration, in T change){
// 	immutable divTimeByDuration = time/duration; 
// 	return change * divTimeByDuration^^2 + begin;
// }

class quad{
	static pure T easeIn(T)(in T time, in T begin, in T duration, in T change){
		immutable divTimeByDuration = time/duration; 
		return change * divTimeByDuration^^2 + begin;
	}
	
	static pure T easeOut(T)(in T time, in T begin, in T duration, in T change){
		immutable divTimeByDuration = time/duration; 
		return -change * divTimeByDuration * (divTimeByDuration-T(2)) + begin;
	}
	
	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		if (time < duration/T(2)){
			return easeIn (time*T(2), 0, change, duration) * T(0.5) + begin;
		}else{
			return easeOut (time*T(2)-duration, 0, change, duration) * T(0.5) + change*T(0.5) + begin;
		}
	}
}
alias easeInQuad = quad.easeIn;
alias easeOutQuad = quad.easeOut;
alias easeInOutQuad = quad.easeInOut;
	
