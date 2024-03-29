import 'package:flutter/material.dart';

class KitPreloader extends StatelessWidget {
  const KitPreloader({
    this.color,
    super.key,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        child: LinearProgressIndicator(
          valueColor: color == null ? null : AlwaysStoppedAnimation(color!),
        ),
      ),
    );
  }
}
