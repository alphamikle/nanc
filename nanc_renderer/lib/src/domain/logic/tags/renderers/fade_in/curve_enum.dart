import 'package:flutter/material.dart';

enum CurveEnum {
  linear,
  decelerate,
  fastLinearToSlowEaseIn,
  ease,
  easeIn,
  easeInToLinear,
  easeInSine,
  easeInQuad,
  easeInCubic,
  easeInQuart,
  easeInQuint,
  easeInExpo,
  easeInCirc,
  easeInBack,
  easeOut,
  linearToEaseOut,
  easeOutSine,
  easeOutQuad,
  easeOutCubic,
  easeOutQuart,
  easeOutQuint,
  easeOutExpo,
  easeOutCirc,
  easeOutBack,
  easeInOut,
  easeInOutSine,
  easeInOutQuad,
  easeInOutCubic,
  easeInOutCubicEmphasized,
  easeInOutQuart,
  easeInOutQuint,
  easeInOutExpo,
  easeInOutCirc,
  easeInOutBack,
  fastOutSlowIn,
  slowMiddle,
  bounceIn,
  bounceOut,
  bounceInOut,
  elasticIn,
  elasticOut,
  elasticInOut;

  Curve toCurve() {
    return switch (this) {
      CurveEnum.linear => Curves.linear,
      CurveEnum.decelerate => Curves.decelerate,
      CurveEnum.fastLinearToSlowEaseIn => Curves.fastLinearToSlowEaseIn,
      CurveEnum.ease => Curves.ease,
      CurveEnum.easeIn => Curves.easeIn,
      CurveEnum.easeInToLinear => Curves.easeInToLinear,
      CurveEnum.easeInSine => Curves.easeInSine,
      CurveEnum.easeInQuad => Curves.easeInQuad,
      CurveEnum.easeInCubic => Curves.easeInCubic,
      CurveEnum.easeInQuart => Curves.easeInQuart,
      CurveEnum.easeInQuint => Curves.easeInQuint,
      CurveEnum.easeInExpo => Curves.easeInExpo,
      CurveEnum.easeInCirc => Curves.easeInCirc,
      CurveEnum.easeInBack => Curves.easeInBack,
      CurveEnum.easeOut => Curves.easeOut,
      CurveEnum.linearToEaseOut => Curves.linearToEaseOut,
      CurveEnum.easeOutSine => Curves.easeOutSine,
      CurveEnum.easeOutQuad => Curves.easeOutQuad,
      CurveEnum.easeOutCubic => Curves.easeOutCubic,
      CurveEnum.easeOutQuart => Curves.easeOutQuart,
      CurveEnum.easeOutQuint => Curves.easeOutQuint,
      CurveEnum.easeOutExpo => Curves.easeOutExpo,
      CurveEnum.easeOutCirc => Curves.easeOutCirc,
      CurveEnum.easeOutBack => Curves.easeOutBack,
      CurveEnum.easeInOut => Curves.easeInOut,
      CurveEnum.easeInOutSine => Curves.easeInOutSine,
      CurveEnum.easeInOutQuad => Curves.easeInOutQuad,
      CurveEnum.easeInOutCubic => Curves.easeInOutCubic,
      CurveEnum.easeInOutCubicEmphasized => Curves.easeInOutCubicEmphasized,
      CurveEnum.easeInOutQuart => Curves.easeInOutQuart,
      CurveEnum.easeInOutQuint => Curves.easeInOutQuint,
      CurveEnum.easeInOutExpo => Curves.easeInOutExpo,
      CurveEnum.easeInOutCirc => Curves.easeInOutCirc,
      CurveEnum.easeInOutBack => Curves.easeInOutBack,
      CurveEnum.fastOutSlowIn => Curves.fastOutSlowIn,
      CurveEnum.slowMiddle => Curves.slowMiddle,
      CurveEnum.bounceIn => Curves.bounceIn,
      CurveEnum.bounceOut => Curves.bounceOut,
      CurveEnum.bounceInOut => Curves.bounceInOut,
      CurveEnum.elasticIn => Curves.elasticIn,
      CurveEnum.elasticOut => Curves.elasticOut,
      CurveEnum.elasticInOut => Curves.elasticInOut,
    };
  }
}
