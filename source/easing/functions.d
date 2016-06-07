module easing.functions;

pure T linear(T)(in T time, in T begin, in T duration, in T change){
	return change/duration * time + begin;
}

class Sine{
	import std.math;
	static pure T easeIn(T)(T time, T begin, T duration, T change){
		return -change * cos(time/duration * (PI/T(2))) + change + begin;
	}
	
	static pure T easeOut(T)(T time, T begin, T duration, T change){
		return change * sin(time/duration * (PI/T(2))) + begin;
	}
	
	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		return -change/T(2) * (cos(PI*time/duration) - T(1)) + begin;
	}
}
alias easeInSine = Sine.easeIn;
alias easeOutSine = Sine.easeOut;
alias easeInOutSine = Sine.easeInOut;

class Qubic{
	static pure T easeIn(T)(in T time, in T begin, in T duration, in T change){
		return change*(time/=duration)*time*time + begin;
	}
	
	static pure T easeOut(T)(T time, T begin, T duration, T change){
		return change*((time=time/duration-T(1))*time*time + T(1)) + begin;
	}
	
	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		if ((time/=duration/T(2)) < T(1)){
			return change/T(2)*time*time*time + begin;
		}else {
			return change/T(2)*((time-=T(2))*time*time + T(2)) + begin;
		}
	}
}
alias easeInQubic = Qubic.easeIn;
alias easeOutQubic = Qubic.easeOut;
alias easeInOutQubic = Qubic.easeInOut;

class Quad{
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

alias easeInQuad = Quad.easeIn;
alias easeOutQuad = Quad.easeOut;
alias easeInOutQuad = Quad.easeInOut;
	
