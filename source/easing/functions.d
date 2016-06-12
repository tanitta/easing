module easing.functions;

pure T linear(T)(in T time){
    return time;
}

unittest{
    assert(0.0.linear == 0.0);
    assert(1.0.linear == 1.0);
}


struct Sine{
    @disable this();

    import std.math;

    static pure T easeIn(T)(in T time){
        return -cos(time * (PI/T(2))) + T(1);
    }

    static pure T easeOut(T)(in T time){
        return sin(time * (PI/T(2)));
    }

    static pure T easeInOut(T)(in T time){
        return T(-0.5) * (cos(PI*time) - T(1));
    }
}

alias easeInSine = Sine.easeIn;
alias easeOutSine = Sine.easeOut;
alias easeInOutSine = Sine.easeInOut;

unittest{
    assert(0.0.easeInSine == 0.0);
    assert(1.0.easeInSine == 1.0);

    assert(0.0.easeOutSine == 0.0);
    assert(1.0.easeOutSine == 1.0);

    assert(0.0.easeInOutSine == 0.0);
    assert(1.0.easeInOutSine == 1.0);
}


struct Qubic{
    @disable this();

    static pure T easeIn(T)(in T time){
        return time^^T(3.0);
    }

    static pure T easeOut(T)(in T time){
        return (time-T(1))^^T(3) + T(1);
    }

    static pure T easeInOut(T)(in T time){
        immutable t2 = time * T(2);
        if (t2 < T(1)){
            return T(0.5)*t2^^T(3);
        }else{
            immutable t2m2 = t2-T(2);
            return T(0.5)*(t2m2^^T(3) + T(2));
        }
    }
}

alias easeInQubic = Qubic.easeIn;
alias easeOutQubic = Qubic.easeOut;
alias easeInOutQubic = Qubic.easeInOut;

unittest{
    assert(0.0.easeInQubic == 0.0);
    assert(1.0.easeInQubic == 1.0);

    assert(0.0.easeOutQubic == 0.0);
    assert(1.0.easeOutQubic == 1.0);

    assert(0.0.easeInOutQubic == 0.0);
    assert(1.0.easeInOutQubic == 1.0);
}


struct Quint{
    @disable this();

    static pure T easeIn(T)(in T time){
        return time^^T(5);
    }

    static pure T easeOut(T)(in T time){
        immutable tm1 = time-T(1);
        return (tm1^^5 + T(1));
    }

    static pure T easeInOut(T)(in T time){
        immutable t2 = time * T(2);
        if (t2 < 1){
            return T(0.5)*t2^^T(5);
        }else {
            immutable t2m2 = t2-T(2);
            return T(0.5)*(t2m2^^T(5) + T(2));
        }
    }
}

alias easeInQuint = Quint.easeIn;
alias easeOutQuint = Quint.easeOut;
alias easeInOutQuint = Quint.easeInOut;

unittest{
    assert(0.0.easeInQuint == 0.0);
    assert(1.0.easeInQuint == 1.0);

    assert(0.0.easeOutQuint == 0.0);
    assert(1.0.easeOutQuint == 1.0);

    assert(0.0.easeInOutQuint == 0.0);
    assert(1.0.easeInOutQuint == 1.0);
}


struct Circ{
    @disable this();

    import std.math;
    static pure T easeIn(T)(in T time){
        return -(sqrt(T(1) - time*time) - T(1));
    }

    static pure T easeOut(T)(in T time){
        T duration = T(1);
        
        immutable tm1 = time - T(1);
        return sqrt(T(1) - tm1^^T(2));
    }

    static pure T easeInOut(T)(in T time){
        immutable t2 = time * T(2);
        if (t2 < T(1)) {
            return -T(0.5) * (sqrt(T(1) - t2^^2) - T(1));
        }else{
            immutable t2m2 = t2 - T(2);
            return T(0.5) * (sqrt(T(1) - t2m2^^2) + T(1));
        }
    }
}

alias easeInCirc = Circ.easeIn;
alias easeOutCirc = Circ.easeOut;
alias easeInOutCirc = Circ.easeInOut;

unittest{
    assert(0.0.easeInCirc == 0.0);
    assert(1.0.easeInCirc == 1.0);

    assert(0.0.easeOutCirc == 0.0);
    assert(1.0.easeOutCirc == 1.0);

    assert(0.0.easeInOutCirc == 0.0);
    assert(1.0.easeInOutCirc == 1.0);
}


struct Elastic{
    @disable this();

    import std.math;

    static pure T easeIn(T)(in T time){
        if (time==T(0)) return T(0);
        if (time==T(1)) return T(1);
        immutable p = T(0.3);
        immutable a = T(1);
        immutable s = p/T(4);
        immutable tm1 = time-T(1);
        T postFix =a*pow(T(2),T(10)*tm1);
        return -(postFix * sin((tm1-s)*(T(2)*T(PI))/p ));
    }

    static pure T easeOut(T)(in T time){
        if (time==T(0)) return T(0);
        if (time==T(1)) return T(1);
        immutable p = T(0.3);
        immutable a = T(1);
        immutable s = p/T(4);
        return (a*pow(T(2),T(-10)*time) * sin( (time-s)*(T(2)*T(PI))/p ) + T(1));
    }

    static pure T easeInOut(T)(in T time){
        if (time==T(0)) return T(0);
        immutable t2 = time * T(2);
        if (t2==T(2)) return T(1);
        T p=T(0.3*1.5);
        T a=T(1);
        T s=p/T(4);

        immutable t2m1 = t2 - T(1);
        if (t2 < T(1)) {
            T postFix =a*pow(T(2),T(10)*(t2m1)); // postIncrement is evil
            return T(-0.5)*(postFix* sin( (t2m1-s)*(T(2)*T(PI))/p ));
        }
        T postFix =  a*pow(T(2),T(-10)*(t2m1)); // postIncrement is evil
        return postFix * sin( (t2m1-s)*(T(2)*T(PI))/p )*T(0.5) + T(1);
    }
}

alias easeInElastic = Elastic.easeIn;
alias easeOutElastic = Elastic.easeOut;
alias easeInOutElastic = Elastic.easeInOut;

unittest{
    assert(0.0.easeInElastic == 0.0);
    assert(1.0.easeInElastic == 1.0);

    assert(0.0.easeOutElastic == 0.0);
    assert(1.0.easeOutElastic == 1.0);

    assert(0.0.easeInOutElastic == 0.0);
    assert(1.0.easeInOutElastic == 1.0);
}


struct Quad{
    @disable this();

    static pure T easeIn(T)(in T time){
        return time^^2;
    }

    static pure T easeOut(T)(in T time){
        return -time * (time-T(2));
    }

    static pure T easeInOut(T)(in T time){
        if (time < T(0.5)){
            return easeIn(time*T(2)) * T(0.5);
        }else{
            return easeOut(time*T(2)-T(1)) * T(0.5) + T(0.5);
        }
    }
}

alias easeInQuad = Quad.easeIn;
alias easeOutQuad = Quad.easeOut;
alias easeInOutQuad = Quad.easeInOut;

unittest{
    assert(0.0.easeInQuad == 0.0);
    assert(1.0.easeInQuad == 1.0);

    assert(0.0.easeOutQuad == 0.0);
    assert(1.0.easeOutQuad == 1.0);

    assert(0.0.easeInOutQuad == 0.0);
    assert(1.0.easeInOutQuad == 1.0);
}


struct Quart{
    @disable this();

    static pure T easeIn(T)(in T time){
        return time^^4;
    }

    static pure T easeOut(T)(in T time){
        immutable tm1 = time - T(1);
        return -(tm1^^4- T(1));
    }

    static pure T easeInOut(T)(in T time){
        immutable t2 = time * T(2);
        if (t2 < T(1)){
            return T(0.5)*t2^^4;
        }else{
            immutable t2m2 = t2 - T(2);
            return T(-0.5) * (t2m2^^4 - T(2));
        }
    }
}

alias easeInQuart = Quart.easeIn;
alias easeOutQuart = Quart.easeOut;
alias easeInOutQuart = Quart.easeInOut;

unittest{
    assert(0.0.easeInQuart == 0.0);
    assert(1.0.easeInQuart == 1.0);

    assert(0.0.easeOutQuart == 0.0);
    assert(1.0.easeOutQuart == 1.0);

    assert(0.0.easeInOutQuart == 0.0);
    assert(1.0.easeInOutQuart == 1.0);
}


struct Expo{
    @disable this();

    import std.math;

    static pure T easeIn(T)(in T time){
        if(time==T(0)){
            return T(0);
        }else{
            return pow(T(2), T(10) * (time- T(1))) + T(0);
        }
    }

    static pure T easeOut(T)(in T time){
        if(time==T(1)){
            return T(1);
        }else{
            return -pow(T(2), T(-10) * time) + T(1);
        }
    }

    static pure T easeInOut(T)(in T time){
        if (time==T(0)) return T(0);
        if (time==T(1)) return T(1);
        immutable t2 = time*T(2);
        if (t2 < T(1)) {
            return T(0.5) * pow(T(2), T(10) * (t2 - T(1)));
        }
        immutable t2m1 = t2;
        return T(0.5) * (-pow(T(2), T(-10) * t2m1) + T(2));
    }
}

alias easeInExpo = Expo.easeIn;
alias easeOutExpo = Expo.easeOut;
alias easeInOutExpo = Expo.easeInOut;

unittest{
    assert(0.0.easeInExpo == 0.0);
    assert(1.0.easeInExpo == 1.0);

    assert(0.0.easeOutExpo == 0.0);
    assert(1.0.easeOutExpo == 1.0);

    assert(0.0.easeInOutExpo == 0.0);
    assert(1.0.easeInOutExpo == 1.0);
}


struct Back{
    @disable this();

    static pure T easeIn(T)(in T time, in T s = 1.70158){
        return time^^2*((s+T(1))*time - s);
    }

    static pure T easeOut(T)(in T time, in T s = 1.70158){
        immutable tm1 = time-T(1);
        return (tm1^^2*((s+T(1))*tm1 + s) + T(1));
    }

    static pure T easeInOut(T)(in T time, in T s = 1.70158){
        immutable sc = s * T(1.525f);
        immutable t2 = time * T(2);
        if (t2 < T(1)){
            return T(0.5)*(t2^^2*((sc+T(1))*t2 - sc));
        }
        immutable t2m2 = t2 - T(2);
        return T(0.5)*(t2m2^^2*((sc+T(1))*t2m2 + sc) + T(2));
    }
}

alias easeInBack = Back.easeIn;
alias easeOutBack = Back.easeOut;
alias easeInOutBack = Back.easeInOut;

unittest{
    import std.math;
    
    assert(approxEqual(0.0.easeInBack, 0.0));
    assert(approxEqual(1.0.easeInBack, 1.0));

    assert(approxEqual(0.0.easeOutBack, 0.0));
    assert(approxEqual(1.0.easeOutBack, 1.0));

    assert(approxEqual(0.0.easeInOutBack, 0.0));
    assert(approxEqual(1.0.easeInOutBack, 1.0));
}


struct Bounce{
    @disable this();

    static pure T easeIn(T)(in T time){
        return T(1)- easeOut(T(1)-time);
    }

    static pure T easeOut(T)(in T time){
        if ((time) < (T(1.0/2.75))) {
            return (T(7.5625)*time^^2);
        } else if (time < T(2.0/2.75)) {
            immutable postFix = time - T(1.5/2.75);
            return (T(7.5625)*postFix^^2+ T(0.75));
        } else if (time < T(2.5/2.75)) {
            immutable postFix = time - T(2.25/2.75);
            return (T(7.5625)*postFix^^2+ T(0.9375));
        } else {
            immutable postFix = time-T(2.625/2.75);
            return (T(7.5625)*postFix^^2+ T(0.984375));
        }
    }

    static pure T easeInOut(T)(in T time){
        if (time < T(0.5)){
            return easeIn(time*T(2)) * T(0.5);
        }else{ 
            return easeOut(time*T(2)-T(1)) * T(0.5) + T(0.5);
        }
    }
}

alias easeInBounce = Bounce.easeIn;
alias easeOutBounce = Bounce.easeOut;
alias easeInOutBounce = Bounce.easeInOut;

unittest{
    import std.math;
    assert(approxEqual(0.0.easeInBounce, 0.0));
    assert(approxEqual(1.0.easeInBounce, 1.0));

    assert(approxEqual(0.0.easeOutBounce, 0.0));
    assert(approxEqual(1.0.easeOutBounce, 1.0));

    assert(approxEqual(0.0.easeInOutBounce, 0.0));
    assert(approxEqual(1.0.easeInOutBounce, 1.0));
}
