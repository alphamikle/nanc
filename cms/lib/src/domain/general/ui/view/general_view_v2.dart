import 'dart:async';

import 'package:animation_debugger/animation_debugger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../logic/bloc/header/menu_state.dart';
import '../../logic/bloc/side_menu/menu_bloc.dart';
import '../component/header_menu.dart';
import '../component/side_menu.dart';

const double kMenuWidth = 241 + kMenuRightPadding;
const double kMenuRightPadding = 24;

const double kHeaderHeight = 48 + kHeaderPadding + kHeaderPadding;
const double kHeaderPadding = 8;

class GeneralViewV2 extends StatefulWidget {
  const GeneralViewV2({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<GeneralViewV2> createState() => _GeneralViewV2State();
}

class _GeneralViewV2State extends State<GeneralViewV2> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Curve get animationCurve => Curves.easeInOutQuart;

  @override
  Duration get animationDuration => const Duration(milliseconds: 500);

  @override
  late final AnimationController animationController = AnimationDebugger.of(context).watch(super.animationController, label: 'MENU');

  // ignore: avoid_positional_boolean_parameters
  Future<void> toggleMenu(bool haveMenuItems) async {
    if (haveMenuItems) {
      await forward();
    } else {
      await animateBack();
    }
  }

  @override
  void initState() {
    super.initState();
    final MenuBloc menuBloc = context.read();
    if (menuBloc.state.elements.isNotEmpty) {
      unawaited(toggleMenu(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    const int maxUrlLength = 50;
    String currentUrl = context.location.uri.toString();
    final String currentRoute = context.location.fullPath;

    if (currentUrl.length > maxUrlLength) {
      currentUrl = currentUrl.substring(0, maxUrlLength);
    }

    return Scaffold(
      body: Stack(
        children: [
          /// ? LEFT MENU
          BlocListener<MenuBloc, MenuState>(
            listenWhen: (MenuState previous, MenuState current) => previous.elements.length != current.elements.length,
            listener: (BuildContext context, MenuState state) async => toggleMenu(state.elements.isNotEmpty),
            child: AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: kMenuWidth * value,
                  child: ColoredBox(
                    color: context.theme.colorScheme.surfaceVariant,
                    child: Opacity(
                      opacity: value,
                      child: child!,
                    ),
                  ),
                );
              },
              child: const SideMenu(),
            ),
          ),

          /// ? TOP MENU
          AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                left: kMenuWidth * value,
                top: 0,
                right: 0,
                height: kHeaderHeight,
                child: child!,
              );
            },
            child: ColoredBox(
              color: context.theme.colorScheme.surfaceVariant,
              child: const Padding(
                padding: EdgeInsets.only(left: Gap.large, top: kHeaderPadding, right: Gap.extra, bottom: kHeaderPadding),
                child: HeaderMenu(),
              ),
            ),
          ),

          /// ? VIEW
          AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                left: kMenuWidth * value,
                top: kHeaderHeight,
                right: 0,
                bottom: 0,
                child: child!,
              );
            },
            child: KitViewContainer(
              child: widget.child,
            ),
          ),

          if (kDebugMode && kIsWeb == false)
            Positioned(
              top: 12,
              right: 32,
              child: Opacity(
                opacity: 0.25,
                child: KitText(
                  text: '''
Current url $currentUrl
Current route $currentRoute
'''
                      .trim(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
