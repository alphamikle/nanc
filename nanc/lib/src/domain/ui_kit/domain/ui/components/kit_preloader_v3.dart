import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nanc_tools/nanc_tools.dart';

class KitPreloaderV3 extends StatelessWidget {
  const KitPreloaderV3({
    super.key,
  }) : centered = false;

  const KitPreloaderV3.center({
    super.key,
  }) : centered = true;

  final bool centered;

  @override
  Widget build(BuildContext context) {
    final Widget preloader = LoadingAnimationWidget.staggeredDotsWave(
      color: context.theme.colorScheme.primary,
      size: 50,
    );
    if (centered) {
      return Center(child: preloader);
    }
    return preloader;
  }
}
