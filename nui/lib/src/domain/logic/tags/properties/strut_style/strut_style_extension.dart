import 'package:flutter/material.dart';

extension ExtendedStrutStyle on StrutStyle {
  StrutStyle copyWith({
    String? fontFamily,
    double? fontSize,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? leading,
    bool? forceStrutHeight,
    String? debugLabel,
    String? weightDescription,
  }) {
    return StrutStyle(
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      height: height ?? this.height,
      leadingDistribution: leadingDistribution ?? this.leadingDistribution,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      leading: leading ?? this.leading,
      forceStrutHeight: forceStrutHeight ?? this.forceStrutHeight,
      debugLabel: debugLabel ?? this.debugLabel,
    );
  }
}
