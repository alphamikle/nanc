import 'dart:async';

import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_circle_preloader.dart';
import 'package:ui_kit/src/components/kit_icons/kit_icons.dart';
import 'package:ui_kit/src/components/kit_ink_well.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_text_field.dart';
import 'package:ui_kit/src/components/kit_modal/kit_base_modal_bottom.dart';
import 'package:ui_kit/src/components/kit_modal/kit_modal_card.dart';
import 'package:ui_kit/src/components/kit_preloader.dart';
import 'package:ui_kit/src/components/kit_tooltip.dart';
import 'package:ui_kit/src/constants/gap.dart';
import 'package:ui_kit/src/theme/kit_borders.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';

class KitIconSelectorModal extends StatefulWidget {
  const KitIconSelectorModal({
    required this.query,
    required this.selectedIcon,
    super.key,
  });

  final String query;
  final EnumValue? selectedIcon;

  @override
  State<KitIconSelectorModal> createState() => _KitIconSelectorModalState();
}

class _KitIconSelectorModalState extends State<KitIconSelectorModal> {
  late EnumValue? selectedIcon = widget.selectedIcon;
  late final TextEditingController searchController = TextEditingController(text: widget.query);
  final List<EnumValue> foundIcons = [];
  bool isLoading = false;
  Timer? queryTimer;

  void controllerListener() => unawaited(finder(searchController.text));

  Future<void> finder(String query) async {
    if (queryTimer != null) {
      queryTimer?.cancel();
      queryTimer = null;
    } else {
      setState(() => isLoading = true);
    }
    queryTimer = Timer(const Duration(milliseconds: 500), () async {
      queryTimer = null;
      logg('Will search icon by query "$query"');
      final List<EnumValue> icons = await iconFinder(query);
      foundIcons.clear();
      foundIcons.addAll(icons);
      setState(() => isLoading = false);
    });
  }

  Future<void> selectIcon(EnumValue iconEnum) async {
    await copyTextToClipboard(iconEnum.title);
    await wait(duration: const Duration(milliseconds: 200));
    setState(() => selectedIcon = iconEnum);
  }

  Widget iconBuilder(BuildContext context, int index) {
    final EnumValue value = foundIcons[index];
    final IconData icon = value.typedValue();
    final bool isSelected = value == selectedIcon;

    final Widget widget = KitInkWell(
      onPressed: () => unawaited(selectIcon(selectedIcon = value)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Icon(
                icon,
                size: 50,
                color: context.theme.colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Gap.regular, right: Gap.regular, bottom: Gap.large),
            child: Text(
              value.title,
              style: context.theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
    return KitTooltip(
      text: value.title,
      child: isSelected
          ? Stack(
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primaryContainer.o5,
                      borderRadius: context.kitBorders.smallRadius,
                    ),
                  ),
                ),
                widget,
              ],
            )
          : widget,
    );
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(controllerListener);
    controllerListener();
  }

  @override
  void dispose() {
    searchController.removeListener(controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KitModalCard(
      onClose: () => context.navigator.pop(),
      header: const Text('Select icon'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Gap.large,
                    top: Gap.large,
                    right: Gap.large,
                    bottom: Gap.large,
                  ),
                  // TODO(alphamikle): Add loader
                  child: Material(
                    child: KitTextField(
                      controller: searchController,
                      label: 'Filter icons',
                      maxLines: 1,
                      suffix: KitCirclePreloader(isLoading: isLoading),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: Gap.large,
                right: Gap.large,
              ), //
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Material(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: isLoading && foundIcons.isEmpty
                        ? const KitPreloader()
                        : foundIcons.isEmpty
                            ? const Center(
                                child: Text('Not found any icon'),
                              )
                            : GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: context.query.size.width ~/ 200,
                                  crossAxisSpacing: Gap.small,
                                  mainAxisSpacing: Gap.small,
                                ),
                                itemBuilder: iconBuilder,
                                itemCount: foundIcons.length,
                              ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Gap.large),
            child: Row(
              children: [
                const Spacer(),
                KitBaseModalBottom(
                  onOk: () => context.navigator.pop(selectedIcon),
                  onCancel: () => context.navigator.pop(null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<EnumValue?> selectIcon({
  required BuildContext context,
  required String query,
  required EnumValue? selectedIcon,
}) async {
  final EnumValue? newSelectedIcon = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => KitIconSelectorModal(
      query: query,
      selectedIcon: selectedIcon,
    ),
  );
  await copyTextToClipboard(newSelectedIcon?.title);
  return newSelectedIcon;
}
