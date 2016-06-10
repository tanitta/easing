module easing;

public import easing.functions;

pure T map(alias F = linear, T, Options...)( in T v, in T minIn, in T maxIn, in T minOut, in T maxOut, Options options){
    T time = v - minIn;
    T change = maxOut - minOut;
    T duration = maxIn - minIn;
    T begin = minOut;

    return F(time, begin, duration, change, options);
}

//map should accept optional args
version(unittest){
    T multiArgsFunction(T)( T time,  T begin,  T duration,  T change, T option1, T option2){return option2;}
}
unittest{
    assert(__traits(compiles, {
        0.0.map!multiArgsFunction(0.0, 10.0, 0.0, 1.0, 0.5, 2.0);
    }));
    assert(0.0.map!multiArgsFunction(0.0, 10.0, 0.0, 1.0, 0.5, 2.0) == 2.0);
}

unittest{
    assert(0.0.map!linear(0.0, 10.0, 0.0, 1.0) == 0.0);
    assert(5.0.map!linear(0.0, 10.0, 0.0, 1.0) == 0.5);
    assert(10.0.map!linear(0.0, 10.0, 0.0, 1.0) == 1.0);

    assert(0.0.map!(Quad.easeIn)(0.0, 10.0, 0.0, 1.0) == 0.0);
    assert(5.0.map!(Quad.easeIn)(0.0, 10.0, 0.0, 1.0) == 0.25);
    assert(10.0.map!(Quad.easeIn)(0.0, 10.0, 0.0, 1.0) == 1.0);

    assert(0.0.map!easeInQuad(0.0, 10.0, 0.0, 1.0) == 0.0.map!(Quad.easeIn)(0.0, 10.0, 0.0, 1.0));
}

private pure T clamp(T)(in T v, in T min, in T max){
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

