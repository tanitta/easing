module easing.functions;

pure T linear(T)(in T time){
    return time;
}

pure T linearS(T)(T[] args...)
in{
    assert(args.length >= 1);
}body{
    return linear!T(args[0]);
}

unittest{
    assert(0.0.linear == 0.0);
    assert(1.0.linear == 1.0);
}

unittest{
    assert([1.0].linearS == 1.0);
    assert(1.0.linearS == 1.0);
}

private mixin template AddFunctionAcceptingSlice(string Name){
    mixin(q"/
        static pure T /"~Name~q"/S(T)(in T[] args...)
        in{
            assert(args.length >= 1);
        }body{
            return /"~Name~q"/!T(args[0]);
        }
    /");
}

unittest{
    assert(1.0.easeInOutSineS == 1.0);
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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInSine = Sine.easeIn;
alias easeOutSine = Sine.easeOut;
alias easeInOutSine = Sine.easeInOut;
alias easeInSineS = Sine.easeInS;
alias easeOutSineS = Sine.easeOutS;
alias easeInOutSineS = Sine.easeInOutS;

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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInQubic = Qubic.easeIn;
alias easeOutQubic = Qubic.easeOut;
alias easeInOutQubic = Qubic.easeInOut;
alias easeInQubicS = Qubic.easeInS;
alias easeOutQubicS = Qubic.easeOutS;
alias easeInOutQubicS = Qubic.easeInOutS;

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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInQuint = Quint.easeIn;
alias easeOutQuint = Quint.easeOut;
alias easeInOutQuint = Quint.easeInOut;
alias easeInQuintS = Quint.easeInS;
alias easeOutQuintS = Quint.easeOutS;
alias easeInOutQuintS = Quint.easeInOutS;

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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInCirc = Circ.easeIn;
alias easeOutCirc = Circ.easeOut;
alias easeInOutCirc = Circ.easeInOut;
alias easeInCircS = Circ.easeInS;
alias easeOutCircS = Circ.easeOutS;
alias easeInOutCircS = Circ.easeInOutS;

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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInElastic = Elastic.easeIn;
alias easeOutElastic = Elastic.easeOut;
alias easeInOutElastic = Elastic.easeInOut;
alias easeInElasticS = Elastic.easeInS;
alias easeOutElasticS = Elastic.easeOutS;
alias easeInOutElasticS = Elastic.easeInOutS;

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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInQuad = Quad.easeIn;
alias easeOutQuad = Quad.easeOut;
alias easeInOutQuad = Quad.easeInOut;
alias easeInQuadS = Quad.easeInS;
alias easeOutQuadS = Quad.easeOutS;
alias easeInOutQuadS = Quad.easeInOutS;

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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInQuart = Quart.easeIn;
alias easeOutQuart = Quart.easeOut;
alias easeInOutQuart = Quart.easeInOut;
alias easeInQuartS = Quart.easeInS;
alias easeOutQuartS = Quart.easeOutS;
alias easeInOutQuartS = Quart.easeInOutS;

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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInExpo = Expo.easeIn;
alias easeOutExpo = Expo.easeOut;
alias easeInOutExpo = Expo.easeInOut;
alias easeInExpoS = Expo.easeInS;
alias easeOutExpoS = Expo.easeOutS;
alias easeInOutExpoS = Expo.easeInOutS;

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

    static pure T easeInS(T)(in T[] args ...)in{
        assert(args.length >= 1);
    }body{
        immutable time = args[0];
        immutable s = (args.length>1)?args[1]:1.70158;
        return easeIn!(T)(time, s);
    }

    static pure T easeOut(T)(in T time, in T s = 1.70158){
        immutable tm1 = time-T(1);
        return (tm1^^2*((s+T(1))*tm1 + s) + T(1));
    }

    static pure T easeOutS(T)(in T[] args ...)in{
        assert(args.length >= 1);
    }body{
        immutable time = args[0];
        immutable s = (args.length>1)?args[1]:1.70158;
        return easeOut!(T)(time, s);
    }

    // static pure T easeInS(T)(in T[] args ...){
    //
    // }

    static pure T easeInOut(T)(in T time, in T s = 1.70158){
        immutable sc = s * T(1.525f);
        immutable t2 = time * T(2);
        if (t2 < T(1)){
            return T(0.5)*(t2^^2*((sc+T(1))*t2 - sc));
        }
        immutable t2m2 = t2 - T(2);
        return T(0.5)*(t2m2^^2*((sc+T(1))*t2m2 + sc) + T(2));
    }

    static pure T easeInOutS(T)(in T[] args ...)in{
        assert(args.length >= 1);
    }body{
        immutable time = args[0];
        immutable s = (args.length>1)?args[1]:1.70158;
        return easeInOut!(T)(time, s);
    }
}

alias easeInBack = Back.easeIn;
alias easeOutBack = Back.easeOut;
alias easeInOutBack = Back.easeInOut;
alias easeInBackS = Back.easeInS;
alias easeOutBackS = Back.easeOutS;
alias easeInOutBackS = Back.easeInOutS;

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

    mixin AddFunctionAcceptingSlice!("easeIn");
    mixin AddFunctionAcceptingSlice!("easeOut");
    mixin AddFunctionAcceptingSlice!("easeInOut");
}

alias easeInBounce = Bounce.easeIn;
alias easeOutBounce = Bounce.easeOut;
alias easeInOutBounce = Bounce.easeInOut;
alias easeInBounceS = Bounce.easeInS;
alias easeOutBounceS = Bounce.easeOutS;
alias easeInOutBounceS = Bounce.easeInOutS;

unittest{
    import std.math;
    assert(approxEqual(0.0.easeInBounce, 0.0));
    assert(approxEqual(1.0.easeInBounce, 1.0));

    assert(approxEqual(0.0.easeOutBounce, 0.0));
    assert(approxEqual(1.0.easeOutBounce, 1.0));

    assert(approxEqual(0.0.easeInOutBounce, 0.0));
    assert(approxEqual(1.0.easeInOutBounce, 1.0));
}


struct Bezier{
    @disable this();
    
    static pure T cubic(T)(in T time, in T x1, in T y1, in T x2, in T y2, in T error = T(0.0001))
    in{
        assert(T(0)<=time && time<=T(1));
        assert(T(0)<=x1 && x1<=T(1));
        assert(T(0)<=x2 && x2<=T(1));
    }body{
        import std.math;
        
        T t = time;
        auto dt = T(0);
        
        do {
            dt = -(cubicParametricF(t, x1, x2) - time) / cubicParametricDF(t, x1, x2);
            if(dt.isNaN)break;
            t += dt;
        } while (dt.fabs > error);
        
        return cubicParametricF(t, y1, y2);
    }

    static pure T cubicS(T)(in T[] args ...)in{
        assert(args.length >= 5);
    }body{
        immutable time = args[0];
        immutable x1= args[1];
        immutable y1= args[2];
        immutable x2= args[3];
        immutable y2= args[4];
        immutable error = (args.length>5)?args[5]:T(0.0001);
        return cubic!T(time, x1, y1, x2, y2, error);
    }
    
    static pure T quad(T)(in T time, in T x, in T y, in T error = T(0.0001))
    in{
        assert(T(0)<=time && time<=T(1));
        assert(T(0)<=x && x<=T(1));
    }body{
        import std.math;
        
        T t = time;
        auto dt = T(0);
        
        do {
            dt = -(quadParametricF(t, x) - time) / quadParametricDF(t, x);
            if(dt.isNaN)break;
            t += dt;
        } while (dt.fabs > error);
        
        return quadParametricF(t, y);
    }

    static pure T quadS(T)(in T[] args ...)in{
        assert(args.length >= 3);
    }body{
        immutable time = args[0];
        immutable x = args[1];
        immutable y = args[2];
        immutable error = (args.length>3)?args[3]:T(0.0001);
        return quad!T(time, x, y, error);
    }
    
    private{
        static pure T cubicParametricF(T)(in T t, in T x1, in T x2){
            return T(3) * (T(1) - t)^^2 * t * x1 + T(3) * (T(1) - t) * t^^2 * x2 + t^^3;
        }
        
        static pure T cubicParametricDF(T)(in T t, in T x1, in T x2){
            return T(-6) * (T(1)-t) * t * x1 +
                T(3) * (T(1)-t) * (T(1) - t) * x1 +
                T(-3) * t^^2 * x2 +
                T(6) * (T(1) - t) * t * x2 + 
                T(3) * t^^2;
        }
        
        static pure T quadParametricF(T)(in T t, in T x){
            return T(2) * (T(1)-t) * t * x + t^^2;
        }
        
        static pure T quadParametricDF(T)(in T t, in T x){
            return T(2) * (T(1)-t) * x - T(2) * t * (T(1) - x);
        }
    }
}

alias easeCubicBezier = Bezier.cubic;
alias easeQuadBezier = Bezier.quad;
alias easeCubicBezierS = Bezier.cubicS;
alias easeQuadBezierS = Bezier.quadS;

unittest{
    import std.math;
    assert(approxEqual(0.0.easeCubicBezier(0.0, 0.0, 1.0, 1.0), 0.0));
    assert(approxEqual(0.5.easeCubicBezier(0.0, 0.0, 1.0, 1.0), 0.5));
    assert(approxEqual(1.0.easeCubicBezier(0.0, 0.0, 1.0, 1.0), 1.0));
    
    assert(approxEqual(0.0.easeCubicBezier(0.17, 0.67, 0.83, 0.67), 0.0));
    assert(approxEqual(1.0.easeCubicBezier(0.17, 0.67, 0.83, 0.67), 1.0));
    
    assert(approxEqual(0.0.easeQuadBezier(0.5, 0.5), 0.0));
    assert(approxEqual(0.5.easeQuadBezier(0.5, 0.5), 0.5));
    assert(approxEqual(1.0.easeQuadBezier(0.5, 0.5), 1.0));
    
    assert(approxEqual(0.0.easeQuadBezier(0.6, 0.7), 0.0));
    assert(approxEqual(1.0.easeQuadBezier(0.6, 0.7), 1.0));
}

unittest{
    import std.math;
    assert(approxEqual(1.0.easeQuadBezierS(0.6, 0.7), 1.0));
    assert(approxEqual(1.0.easeCubicBezierS(0.0, 0.0, 1.0, 1.0), 1.0));
    assert(approxEqual(1.0.easeCubicBezierS(0.0, 0.0, 1.0, 1.0, 0.00001), 1.0));
    assert(approxEqual(easeCubicBezierS([1.0, 0.0, 0.0, 1.0, 1.0]), 1.0));
    assert(approxEqual([1.0, 0.0, 0.0, 1.0, 1.0].easeCubicBezierS, 1.0));
}
