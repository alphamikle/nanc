import 'package:flutter/cupertino.dart';

class KitShowIf extends StatelessWidget {
  const KitShowIf({
    this.c1 = false,
    this.w1,
    this.c2 = false,
    this.w2,
    this.c3 = false,
    this.w3,
    this.c4 = false,
    this.w4,
    this.c5 = false,
    this.w5,
    this.c6 = false,
    this.w6,
    this.c7 = false,
    this.w7,
    this.fallback,
    super.key,
  });

  final bool c1;
  final Widget? w1;
  final bool c2;
  final Widget? w2;
  final bool c3;
  final Widget? w3;
  final bool c4;
  final Widget? w4;
  final bool c5;
  final Widget? w5;
  final bool c6;
  final Widget? w6;
  final bool c7;
  final Widget? w7;
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    if (c1) {
      return w1!;
    } else if (c2) {
      return w2!;
    } else if (c3) {
      return w3!;
    } else if (c4) {
      return w4!;
    } else if (c5) {
      return w5!;
    } else if (c6) {
      return w6!;
    } else if (c7) {
      return w7!;
    }
    return fallback ?? const SizedBox.shrink();
  }
}
