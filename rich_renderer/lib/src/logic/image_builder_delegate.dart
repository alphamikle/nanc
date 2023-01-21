import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

class ImageBuilderDelegate extends InheritedWidget {
  const ImageBuilderDelegate({
    required super.child,
    required this.loadingBuilder,
    required this.errorBuilder,
    super.key,
  });

  // ignore: prefer_constructors_over_static_methods
  static ImageBuilderDelegate of(BuildContext context) {
    final ImageBuilderDelegate? delegate = context.dependOnInheritedWidgetOfExactType<ImageBuilderDelegate>();
    if (delegate == null) {
      if (kDebugMode) {
        logg('ImageBuilderDelegate not found in the widget tree. Image builders will be null');
      }
      return const ImageBuilderDelegate(
        loadingBuilder: null,
        errorBuilder: null,
        child: SizedBox(),
      );
    }
    return delegate;
  }

  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
