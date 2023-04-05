import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../service/config/config.dart';
import '../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../logic/bloc/header/menu_state.dart';
import '../../logic/bloc/side_menu/menu_bloc.dart';
import '../../logic/model/menu_element.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  Widget menuItemBuilder(BuildContext context, int index) {
    final MenuBloc menuBloc = context.read();
    if (menuBloc.state.elements.isEmpty) {
      return const SizedBox.shrink();
    }
    final MenuElement element = menuBloc.state.elements[index];
    final Model? entity = context.read<ModelListBloc>().state.allModels.firstWhereOrNull((Model entity) => entity.name == element.title);
    final bool isActive = menuBloc.state.activeElement == element;

    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? kPadding : 0, bottom: kPadding),
      child: KitMenuItem(
        text: element.title,
        icon: tryToGetIconByName(entity?.icon ?? '') ?? IconPack.flu_circle_small_regular,
        onPressed: () => context.vRouter.to(element.url),
        isActive: isActive,
      ),
    );
  }

  //

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kPadding, top: kPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: kPadding),
                  child: Text(
                    'NANC',
                    style: context.theme.textTheme.headlineSmall?.copyWith(
                      fontFamily: GoogleFonts.rubikMoonrocks().fontFamily,
                      fontSize: 36,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: kPaddingLarge),
            child: BlocBuilder<MenuBloc, MenuState>(
              builder: (BuildContext context, MenuState state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: state.isLoading
                      ? const KitPreloader()
                      : state.elements.isEmpty
                          ? const SizedBox()
                          : Material(
                              type: MaterialType.transparency,
                              child: ListView.builder(
                                key: ValueKey(state.elements),
                                itemBuilder: menuItemBuilder,
                                itemCount: state.elements.length,
                              ),
                            ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
