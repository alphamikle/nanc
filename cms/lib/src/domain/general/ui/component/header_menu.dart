import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../service/config/config.dart';
import '../../../tutorial/content/tutorial_content.dart';
import '../../../tutorial/logic/bloc/tutorial_bloc.dart';
import '../../../tutorial/ui/component/tutorial_target.dart';
import '../../logic/bloc/header/header_bloc.dart';
import '../../logic/bloc/header/menu_state.dart';
import '../../logic/model/menu_element.dart';

const double kMenuItemWidth = 80;

class HeaderMenu extends StatefulWidget {
  const HeaderMenu({
    super.key,
  });

  @override
  State<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
  Future<void> showIconsSelector() async {
    await selectIcon(
      context: context,
      query: '',
      selectedIcon: null,
    );
  }

  Widget buildMenuItem(BuildContext context, int index) {
    final HeaderBloc headerBloc = context.read();
    final MenuElement element = headerBloc.state.elements[index];
    final GlobalKey? showcaseKey = context.read<TutorialBloc>().keyForHeaderMenuItem(element.title);
    final Widget menuItem = KitTextIndicatedButton(
      text: element.title,
      onPressed: () => element.title == iconsMenuItemTitle ? unawaited(showIconsSelector()) : context.vRouter.to(element.url),
      isActive: headerBloc.state.activeElement == element,
    );

    return Padding(
      padding: const EdgeInsets.only(right: kPaddingLarge),
      child: showcaseKey == null
          ? menuItem
          : TutorialTarget(
              showcaseKey: showcaseKey,
              text: TutorialContent.descriptionForHeaderButton(element.title),
              borderRadius: BorderRadius.circular(12),
              child: menuItem,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: BlocBuilder<HeaderBloc, MenuState>(
        builder: (BuildContext context, MenuState state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: buildMenuItem,
            itemCount: state.elements.length,
          );
        },
      ),
    );
  }
}
