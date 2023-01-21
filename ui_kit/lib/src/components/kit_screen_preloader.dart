import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

const Duration _kDelay = Duration(milliseconds: 200);

class KitScreenPreloader extends StatefulWidget {
  const KitScreenPreloader({
    required this.builder,
    this.delayBeforeBuildChild = _kDelay,
    this.delayAfterBuildChild = _kDelay,
    this.timeForHide = _kDelay,
    super.key,
  });

  final WidgetBuilder builder;
  final Duration delayBeforeBuildChild;
  final Duration delayAfterBuildChild;
  final Duration timeForHide;

  @override
  State<KitScreenPreloader> createState() => _KitScreenPreloaderState();
}

class _KitScreenPreloaderState extends State<KitScreenPreloader> with AfterRender {
  bool _isPreloaderVisible = true;
  bool _isPreloaderExist = true;
  bool _canCreateChild = false;

  void _buildChild() {
    setState(() {
      _canCreateChild = true;
    });
  }

  void _hidePreloader() {
    setState(() {
      _isPreloaderVisible = false;
    });
  }

  void _removePreloader() {
    setState(() {
      _isPreloaderExist = false;
    });
  }

  Future<void> _startAnimation() async {
    await Future<void>.delayed(widget.delayBeforeBuildChild, _buildChild);
    await Future<void>.delayed(widget.delayAfterBuildChild, _hidePreloader);
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
              ),
            ),
          ),
      ],
    );
  }
}
