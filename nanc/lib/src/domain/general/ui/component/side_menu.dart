import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:icons/icons.dart';
import 'package:nanc_model/nanc_model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../service/config/config.dart';
import '../../../../service/tools/assets_loader.dart';
import '../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../logic/bloc/header/menu_state.dart';
import '../../logic/bloc/side_menu/menu_bloc.dart';
import '../../logic/model/menu_element.dart';

const double kLogoSize = 40;

class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with SingleTickerProviderStateMixin, AnimatedState {
  final List<MenuElement> previousElements = [];
  final List<MenuElement> currentElements = [];

  bool isPreviousVisible = false;
  bool isCurrentVisible = true;

  @override
  double initialValue = 1;

  @override
  Curve get animationCurve => Curves.easeIn;

  @override
  Duration get animationDuration => const Duration(milliseconds: 300);

  Future<void> _changeMenuElements(MenuState state) async {
    if (previousElements.isEmpty && currentElements.isEmpty) {
      animationController.value = 1;
      currentElements.addAll(state.elements);
      safeSetState();
      return;
    }
    previousElements.clear();
    previousElements.addAll(currentElements);
    currentElements.clear();
    currentElements.addAll(state.elements);
    isPreviousVisible = true;
    safeSetState();
    await forward(from: 0);
    isPreviousVisible = false;
    safeSetState();
  }

  Widget menuItemBuilder(BuildContext context, int index, {bool previous = false}) {
    final List<MenuElement> source = previous ? previousElements : currentElements;
    if (source.isEmpty) {
      return const SizedBox.shrink();
    }
    final MenuElement element = source[index];
    final Model? model = context.read<ModelListBloc>().state.allModels.firstWhereOrNull((Model entity) => entity.name == element.title);

    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? Gap.regular : 0, bottom: Gap.regular),
      child: BlocBuilder<MenuBloc, MenuState>(
        buildWhen: (MenuState previous, MenuState current) => previous.activeElement != current.activeElement,
        builder: (BuildContext context, MenuState state) => KitMenuItem(
          text: element.title,
          icon: IconsStorage.tryToGetIconByName(model?.icon ?? '') ?? IconPack.flu_circle_small_regular,
          onPressed: () => context.go(element.url),
          isActive: state.activeElement == element,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Gap.large),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SvgPicture.asset(
                    prepareAssetPath('assets/images/logo_light.svg'),
                    height: kLogoSize,
                    width: kLogoSize,
                    colorFilter: ColorFilter.mode(context.theme.colorScheme.primary, BlendMode.srcIn),
                  ),
                ),
                const SizedBox(width: Gap.regular),
                Flexible(
                  child: SvgPicture.asset(
                    prepareAssetPath('assets/images/name_light.svg'),
                    height: kLogoSize,
                    width: kLogoSize,
                    colorFilter: ColorFilter.mode(context.theme.colorScheme.primary, BlendMode.srcIn),
                  ),
                ),
                // Flexible(
                //   child: KitText(
                //     text: 'Nanc',
                //     style: context.theme.textTheme.headlineSmall?.copyWith(
                //       fontFamily: GoogleFonts.poppins().fontFamily,
                //       fontSize: 36,
                //       color: context.theme.colorScheme.primary,
                //     ),
                //     maxLines: 1,
                //     overflow: TextOverflow.fade,
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: kPaddingLarge),
              child: BlocListener<MenuBloc, MenuState>(
                listenWhen: (MenuState previous, MenuState current) => previous.elements != current.elements,
                listener: (BuildContext context, MenuState state) async => _changeMenuElements(state),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (isPreviousVisible)
                      ColoredBox(
                        color: context.theme.colorScheme.surfaceVariant,
                        child: Material(
                          type: MaterialType.transparency,
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) => menuItemBuilder(context, index, previous: true),
                            itemCount: previousElements.length,
                          ),
                        ),
                      ),
                    if (isCurrentVisible)
                      AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget? child) => KitWaveTransition(
                          animation: animation,
                          startingPoint: FractionalOffset.topLeft,
                          child: child!,
                        ),
                        child: ColoredBox(
                          color: context.theme.colorScheme.surfaceVariant,
                          child: Material(
                            type: MaterialType.transparency,
                            child: ListView.builder(
                              physics: currentElements.length < 10 ? const NeverScrollableScrollPhysics() : null,
                              itemBuilder: (BuildContext context, int index) => menuItemBuilder(context, index),
                              itemCount: currentElements.length,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
