import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

const Duration _kDelay = Duration(milliseconds: 250);

class KitScreenPreloader extends StatefulWidget {
  const KitScreenPreloader({
    required this.builder,
    this.loader,
    this.futureBeforeBuildChild,
    this.delayBeforeBuildChild = _kDelay,
    this.delayAfterBuildChild = _kDelay,
    this.timeForHide = _kDelay,
    this.onShowChild,
    super.key,
  });

  final WidgetBuilder builder;
  final Widget? loader;
  final Future<void>? futureBeforeBuildChild;
  final Duration delayBeforeBuildChild;
  final Duration delayAfterBuildChild;
  final Duration timeForHide;
  final VoidCallback? onShowChild;

  @override
  KitScreenPreloaderState createState() => KitScreenPreloaderState();
}

class KitScreenPreloaderState extends State<KitScreenPreloader> with AfterRender {
  bool _isPreloaderVisible = true;
  bool _isPreloaderExist = true;
  bool _canCreateChild = false;

  void _buildChild() {
    safeSetState(() {
      _canCreateChild = true;
    });
  }

  void _hidePreloader() {
    safeSetState(() {
      _isPreloaderVisible = false;
    });
  }

  void _removePreloader() {
    safeSetState(() {
      _isPreloaderExist = false;
    });
  }

  Future<void> disablePreloadedScreen() async {
    safeSetState(() => _isPreloaderExist = true);
    await Future<void>.delayed(const Duration(milliseconds: 10));
    safeSetState(() => _isPreloaderVisible = true);
    await Future<void>.delayed(const Duration(milliseconds: 250));
    safeSetState(() => _canCreateChild = false);
  }

  Future<void> _startAnimation() async {
    if (widget.futureBeforeBuildChild != null) {
      await widget.futureBeforeBuildChild;
      _buildChild();
    } else {
      await Future<void>.delayed(widget.delayBeforeBuildChild, _buildChild);
    }
    await Future<void>.delayed(widget.delayAfterBuildChild, _hidePreloader);
    widget.onShowChild?.call();
    await Future<void>.delayed(Duration(milliseconds: widget.timeForHide.inMilliseconds + 20), _removePreloader);
  }

  @override
  Future<void> afterRender() async {
    await _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_canCreateChild) Positioned.fill(child: widget.builder(context)),
        if (_isPreloaderExist)
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: _isPreloaderVisible ? 1 : 0,
              duration: widget.timeForHide,
              child: ColoredBox(
                color: context.theme.colorScheme.surface,
                child: widget.loader,
              ),
            ),
          ),
      ],
    );
  }
}
