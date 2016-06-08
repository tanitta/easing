easing
====

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/tanitta/easing/blob/master/LICENSE)

##Description

easing is a library that add flavor to motion in D programming language.

##Usage

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

##Easing functions

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

Please look at [http://easings.net/](http://easings.net/) regarding details of implemented functions.
