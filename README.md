easing
====

[![Dub version](https://img.shields.io/dub/v/easing.svg)](https://code.dlang.org/packages/easing)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/tanitta/easing/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/tanitta/easing.svg?branch=master)](https://travis-ci.org/tanitta/easing)
[![Dub downloads](https://img.shields.io/dub/dt/easing.svg)](https://code.dlang.org/packages/easing)

##　Description

easing is a library that add flavor to motion in D programming language.

##　Usage
```
import easing;
auto output = input.linear;
//                  |
// easing function -+

```

If you would like to call with custom range, 

```
import easing;
auto output = input.map!linear(0.0, 10.0, 0.0, 1.0);
//                      |      |    |     |    |
// easing function -----+      |    |     |    |
// min of input ---------------+    |     |    |
// max of input --------------------+     |    |
// min of output -------------------------+    |
// max of output ------------------------------+
```

Some functions have option.

```
auto output = input.easeQuadBezier(0.6, 0.7);
auto output = input.easeCubicBezier(0.0, 1.0, 1.0, 0.0);

auto output = input.easeInBack(1.5);
```

```
auto output = input.map!easeInBack(0.0, 10.0, 0.0, 1.0, 1.5);
```

##　Easing functions

- linear
- easeInSine
- easeOutSine
- easeInOutSine
- easeInCubic
- easeOutCubic
- easeInOutCubic
- easeInQuint
- easeOutQuint
- easeInOutQuint
- easeInCirc
- easeOutCirc
- easeInOutCirc
- easeInElastic
- easeOutElastic
- easeInOutElastic
- easeInQuad
- easeOutQuad
- easeInOutQuad
- easeInQuart
- easeOutQuart
- easeInOutQuart
- easeInExpo
- easeOutExpo
- easeInOutExpo
- easeInBack
- easeOutBack
- easeInOutBack
- easeInBounce
- easeOutBounce
- easeInOutBounce
- easeCubicBezier
- easeQuadBezier

Please look at [http://easings.net/](http://easings.net/) regarding details of implemented functions.
