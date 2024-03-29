import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../domain/ui_kit/domain/ui/components/kit_text.dart';
import 'episode.dart';
import 'scenario.dart';

class ScenarioPlayer extends StatefulWidget {
  const ScenarioPlayer({
    required this.scenario,
    this.textStyle,
    super.key,
  });

  final Scenario scenario;
  final TextStyle? textStyle;

  @override
  State<ScenarioPlayer> createState() => _ScenarioPlayerState();
}

class _ScenarioPlayerState extends State<ScenarioPlayer> {
  int activeEpisode = 0;

  Future<void> showContent() async {
    if (activeEpisode >= widget.scenario.episodes.length) {
      return;
    }

    Episode? currentEpisode;
    if (activeEpisode >= 0) {
      final Episode episode = widget.scenario.episodes[activeEpisode];
      currentEpisode = episode;
      if (episode.delay != null) {
        await wait(duration: episode.delay!);
      }
    }
    if (mounted == false) {
      return;
    }
    safeSetState(() {
      activeEpisode++;
    });
    await wait(duration: widget.scenario.delayFactory(currentEpisode));
    await showContent();
  }

  Widget widgetBuilder(BuildContext context, int index) {
    final Episode episode = widget.scenario.episodes[index];
    late final Widget child;
    if (episode.text != null) {
      child = KitText(
        text: episode.text!,
        height: 1.5,
        style: episode.style ?? widget.textStyle,
      );
    } else if (episode.builder != null) {
      child = episode.builder!(context);
    } else {
      child = const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AnimatedOpacity(
        opacity: activeEpisode > index ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: child,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    unawaited(showContent());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: widgetBuilder,
      itemCount: widget.scenario.episodes.length,
    );
  }
}
