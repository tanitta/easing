module easing;

public import easing.functions;

pure T map(alias F = linear, T, Options...)( in T input, in T minIn, in T maxIn, in T minOut, in T maxOut, Options options){
    T inputUnit = (input - minIn) / (maxIn - minIn);
    T outputUnit = F(inputUnit, options);
    return outputUnit * (maxOut - minOut) + minOut;
}

// map should ease with custom range
unittest{
    assert(0.0.map!linear(0.0, 10.0, 0.0, 1.0) == 0.0);
    assert(5.0.map!linear(0.0, 10.0, 0.0, 1.0) == 0.5);
    assert(10.0.map!linear(0.0, 10.0, 0.0, 1.0) == 1.0);

    assert(0.0.map!(Quad.easeIn)(0.0, 10.0, 0.0, 1.0) == 0.0);
    assert(5.0.map!(Quad.easeIn)(0.0, 10.0, 0.0, 1.0) == 0.25);
    assert(10.0.map!(Quad.easeIn)(0.0, 10.0, 0.0, 1.0) == 1.0);

    assert(0.0.map!easeInQuad(0.0, 10.0, 0.0, 1.0) == 0.0.map!(Quad.easeIn)(0.0, 10.0, 0.0, 1.0));
}

// map should accept optional args
version(unittest){
    T multiArgsFunction(T)( T time, T option1, T option2){return option2;}
}

unittest{
    assert(__traits(compiles, {
        0.0.map!multiArgsFunction(0.0, 10.0, 0.0, 1.0, 0.5, 2.0);
    }));
    assert(0.0.map!multiArgsFunction(0.0, 10.0, 0.0, 1.0, 0.5, 2.0) == 2.0);
}
