module easing.functions;

pure T linear(T)(in T time, in T begin, in T duration, in T change){
	return change/duration * time + begin;
}

unittest{
	assert(0.0.linear(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.linear(0.0, 10.0, 10.0) == 10.0);
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

unittest{
	assert(0.0.easeInSine(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInSine(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeOutSine(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeOutSine(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeInOutSine(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInOutSine(0.0, 10.0, 10.0) == 10.0);
}


class Qubic{
	static pure T easeIn(T)(T time, T begin, T duration, T change){
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

unittest{
	assert(0.0.easeInQubic(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInQubic(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeOutQubic(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeOutQubic(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeInOutQubic(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInOutQubic(0.0, 10.0, 10.0) == 10.0);
}


class Quint{
	static pure T easeIn(T)(T time, T begin, T duration, T change){
		return change*(time/=duration)*time*time*time*time + begin;
	}
	
	static pure T easeOut(T)(T time, T begin, T duration, T change){
		return change*((time=time/duration-T(1))*time*time*time*time + T(1)) + begin;
	}
	
	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		if ((time/=duration/T(2)) < 1){
			return change/T(2)*time*time*time*time*time + begin;
		}else {
			return change/T(2)*((time-=T(2))*time*time*time*time + T(2)) + begin;
		}
	}
}

alias easeInQuint = Quint.easeIn;
alias easeOutQuint = Quint.easeOut;
alias easeInOutQuint = Quint.easeInOut;

unittest{
	assert(0.0.easeInQuint(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInQuint(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeOutQuint(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeOutQuint(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeInOutQuint(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInOutQuint(0.0, 10.0, 10.0) == 10.0);
}


class Circ{
	import std.math;
	static pure T easeIn(T)(T time, T begin, T duration, T change){
		return -change * (sqrt(T(1) - (time/=duration)*time) - T(1)) + begin;
	}
	
	static pure T easeOut(T)(T time, T begin, T duration, T change){
		return change * sqrt(T(1) - (time=time/duration-1)*time) + begin;
	}
	
	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		if ((time/=duration/T(2)) < T(1)) {
			return -change/T(2) * (sqrt(T(1) - time*time) - T(1)) + begin;
		}else{
			return change/T(2) * (sqrt(T(1) - (time-=T(2))*time) + T(1)) + begin;
		}
	}
}

alias easeInCirc = Circ.easeIn;
alias easeOutCirc = Circ.easeOut;
alias easeInOutCirc = Circ.easeInOut;

unittest{
	assert(0.0.easeInCirc(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInCirc(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeOutCirc(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeOutCirc(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeInOutCirc(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInOutCirc(0.0, 10.0, 10.0) == 10.0);
}


class Elastic{
	import std.math;
	static pure T easeIn(T)(T time, T begin, T duration, T change){
		if (time==T(0)) return begin;
		if ((time/=duration)==T(1)) return begin+change;
		T p = duration*T(0.3);
		T a = change;
		T s = p/T(4);
		T postFix =a*pow(T(2),T(10)*(time-=T(1)));
		return -(postFix * sin((time*duration-s)*(T(2)*T(PI))/p )) + begin; 
	}
	
	static pure T easeOut(T)(T time, T begin, T duration, T change){
		if (time==T(0)) return begin;
		if ((time/=duration)==T(1)) return begin+change;
		T p = duration*T(0.3);
		T a = change;
		T s = p/T(4);
		return (a*pow(T(2),T(-10)*time) * sin( (time*duration-s)*(T(2)*T(PI))/p ) + change + begin);
	}
	
	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		if (time==T(0)) return begin;
		if ((time/=duration/T(2))==T(2)) return begin+change;
		T p=duration*T(0.3*1.5);
		T a=change;
		T s=p/T(4);

		if (time < T(1)) {
			T postFix =a*pow(T(2),T(10)*(time-=T(1))); // postIncrement is evil
			return T(-0.5)*(postFix* sin( (time*duration-s)*(T(2)*T(PI))/p )) + begin;
		}
		T postFix =  a*pow(T(2),T(-10)*(time-=T(1))); // postIncrement is evil
		return postFix * sin( (time*duration-s)*(T(2)*T(PI))/p )*T(0.5) + change + begin;
	}
	
}

alias easeInElastic = Elastic.easeIn;
alias easeOutElastic = Elastic.easeOut;
alias easeInOutElastic = Elastic.easeInOut;

unittest{
	assert(0.0.easeInElastic(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInElastic(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeOutElastic(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeOutElastic(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeInOutElastic(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInOutElastic(0.0, 10.0, 10.0) == 10.0);
}


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

unittest{
	assert(0.0.easeInQuad(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInQuad(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeOutQuad(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeOutQuad(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeInOutQuad(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInOutQuad(0.0, 10.0, 10.0) == 10.0);
}
	

class Quart{
	static pure T easeIn(T)(T time, T begin, T duration, T change){
		return change*(time/=duration)*time*time*time + begin;
	}

	static pure T easeOut(T)(T time, T begin, T duration, T change){
		return -change * ((time=time/duration-T(1))*time*time*time - T(1)) + begin;
	}

	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		if ((time/=duration/T(2)) < T(1)){
			return change/T(2)*time*time*time*time + begin;
		}else{
			return -change/T(2) * ((time-=T(2))*time*time*time - T(2)) + begin;
		}
	}
}

alias easeInQuart = Quart.easeIn;
alias easeOutQuart = Quart.easeOut;
alias easeInOutQuart = Quart.easeInOut;

unittest{
	assert(0.0.easeInQuart(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInQuart(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeOutQuart(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeOutQuart(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeInOutQuart(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInOutQuart(0.0, 10.0, 10.0) == 10.0);
}


class Expo{
	import std.math;
	static pure T easeIn(T)(T time, T begin, T duration, T change){
		return (time==T(0)) ? begin : change * pow(T(2), T(10) * (time/duration - T(1))) + begin;
	}

	static pure T easeOut(T)(T time, T begin, T duration, T change){
		return (time==duration) ? begin+change : change * (-pow(T(2), T(-10) * time/duration) + T(1)) + begin;
	}

	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		if (time==T(0)) return begin;
		if (time==duration) return begin+change;
		if ((time/=duration/T(2)) < T(1)) return change/T(2) * pow(T(2), T(10) * (time - T(1))) + begin;
		return change/T(2) * (-pow(T(2), T(-10) * --time) + T(2)) + begin;
	}
}

alias easeInExpo = Expo.easeIn;
alias easeOutExpo = Expo.easeOut;
alias easeInOutExpo = Expo.easeInOut;

unittest{
	assert(0.0.easeInExpo(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInExpo(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeOutExpo(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeOutExpo(0.0, 10.0, 10.0) == 10.0);
	
	assert(0.0.easeInOutExpo(0.0, 10.0, 10.0) == 0.0);
	assert(10.0.easeInOutExpo(0.0, 10.0, 10.0) == 10.0);
}


class Back{
	static pure T easeIn(T)(T time, T begin, T duration, T change, T s = 1.70158){
		immutable T postFix = time/=duration;
		return change*(postFix)*time*((s+T(1))*time - s) + begin;
	}

	static pure T easeOut(T)(T time, T begin, T duration, T change, T s = 1.70158){
		time=time/duration-T(1);
		return change*(time*time*((s+T(1))*time + s) + T(1)) + begin;
	}

	static pure T easeInOut(T)(T time, T begin, T duration, T change, T s = 1.70158){
		s*=(1.525f);
		if ((time/=duration/T(2)) < T(1)){
			return change/T(2)*(time*time*((s+T(1))*time - s)) + begin;
		}
		immutable T postFix = time-=T(2);
		return change/T(2)*((postFix)*time*((s+T(1))*time + s) + T(2)) + begin;
	}
}

alias easeInBack = Back.easeIn;
alias easeOutBack = Back.easeOut;
alias easeInOutBack = Back.easeInOut;

unittest{
	import std.math;
	assert(approxEqual(0.0.easeInBack(0.0, 10.0, 10.0), 0.0));
	assert(approxEqual(10.0.easeInBack(0.0, 10.0, 10.0), 10.0));
	
	assert(approxEqual(0.0.easeOutBack(0.0, 10.0, 10.0), 0.0));
	assert(approxEqual(10.0.easeOutBack(0.0, 10.0, 10.0), 10.0));
	
	assert(approxEqual(0.0.easeInOutBack(0.0, 10.0, 10.0), 0.0));
	assert(approxEqual(10.0.easeInOutBack(0.0, 10.0, 10.0), 10.0));
}


class Bounce{
	static pure T easeIn(T)(T time, T begin, T duration, T change){
		return change - easeOut(duration-time, T(0), change, duration) + begin;
	}

	static pure T easeOut(T)(T time, T begin, T duration, T change){
		if ((time/=duration) < (T(1.0/2.75))) {
			return change*(T(7.5625)*time*time) + begin;
		} else if (time < T(2.0/2.75)) {
			immutable postFix = time-= T(1.5/2.75);
			return change*(T(7.5625)*(postFix)*time + T(0.75)) + begin;
		} else if (time < T(2.5/2.75)) {
			immutable postFix = time-= T(2.25/2.75);
			return change*(T(7.5625)*(postFix)*time + T(0.9375)) + begin;
		} else {
			immutable postFix = time-=T(2.625/2.75);
			return change*(T(7.5625)*(postFix)*time + T(0.984375)) + begin;
		}
	}

	static pure T easeInOut(T)(T time, T begin, T duration, T change){
		if (time < duration/T(2)){
			return easeIn(time*T(2), T(0), change, duration) * T(0.5) + begin; 
		}else{ 
			return easeOut(time*T(2)-duration, T(0), change, duration) * T(0.5) + change*T(0.5) + begin;
		}
	}
}

alias easeInBounce = Bounce.easeIn;
alias easeOutBounce = Bounce.easeOut;
alias easeInOutBounce = Bounce.easeInOut;

unittest{
	import std.math;
	assert(approxEqual(0.0.easeInBounce(0.0, 10.0, 10.0), 0.0));
	assert(approxEqual(10.0.easeInBounce(0.0, 10.0, 10.0), 10.0));
	
	assert(approxEqual(0.0.easeOutBounce(0.0, 10.0, 10.0), 0.0));
	assert(approxEqual(10.0.easeOutBounce(0.0, 10.0, 10.0), 10.0));
	
	assert(approxEqual(0.0.easeInOutBounce(0.0, 10.0, 10.0), 0.0));
	assert(approxEqual(10.0.easeInOutBounce(0.0, 10.0, 10.0), 10.0));
}
