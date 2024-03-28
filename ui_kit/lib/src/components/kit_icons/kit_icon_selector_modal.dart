import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanc/fields.dart';
import 'package:tools/tools.dart';

import '../../constants/gap.dart';
import '../../theme/kit_borders.dart';
import '../../theme/kit_colors.dart';
import '../kit_centered_text.dart';
import '../kit_column.dart';
import '../kit_ink_well.dart';
import '../kit_inputs/kit_text_field.dart';
import '../kit_modal/kit_base_modal_bottom.dart';
import '../kit_modal/kit_modal.dart';
import '../kit_preloader_v2.dart';
import '../kit_text.dart';
import '../kit_tooltip.dart';
import 'kit_icons.dart';

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
      safeSetState(() => isLoading = true);
    }
    queryTimer = Timer(const Duration(milliseconds: 500), () async {
      queryTimer = null;
      logInfo('Will search icon by query "$query"');
      final List<EnumValue> icons = await iconFinder(query);
      foundIcons.clear();
      foundIcons.addAll(icons);
      safeSetState(() => isLoading = false);
    });
  }

  Future<void> selectIcon(EnumValue iconEnum) async {
    await copyTextToClipboard(iconEnum.title);
    await wait(duration: const Duration(milliseconds: 200));
    safeSetState(() => selectedIcon = iconEnum);
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
            child: KitText(
              text: value.title,
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
                      color: context.theme.colorScheme.primaryContainer.o50,
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
    return KitModal(
      onClose: () => context.navigator.pop(),
      header: const KitText(text: 'Select icon'),
      child: KitColumn(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: Gap.regular,
              top: Gap.regular,
              right: Gap.regular,
              bottom: Gap.regular,
            ),
            child: Material(
              child: KitTextField(
                controller: searchController,
                label: 'Filter icons',
                maxLines: 1,
              ),
            ),
          ),
          KitPreloaderV2(isLoading: isLoading),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: Gap.regular,
                right: Gap.regular,
              ), //
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Material(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: isLoading && foundIcons.isEmpty
                        ? const KitCenteredText(text: 'Loading')
                        : foundIcons.isEmpty
                            ? const KitCenteredText(text: 'Not found any icon')
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
