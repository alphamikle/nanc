import 'package:cms/src/domain/editor/ui/component/manual_menu.dart';
import 'package:cms/src/domain/editor/ui/component/page_editor.dart';
import 'package:cms/src/domain/general/ui/view/general_view_v2.dart';
import 'package:cms/src/domain/preview/ui/component/page_preview_with_frame.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class TagsManual extends StatefulWidget {
  const TagsManual({super.key});

  @override
  State<TagsManual> createState() => _TagsManualState();
}

class _TagsManualState extends State<TagsManual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: kHeaderHeight,
            child: ColoredBox(
              color: context.theme.colorScheme.surfaceVariant,
              child: Padding(
                padding: const EdgeInsets.only(left: Gap.regular, right: Gap.regular),
                child: KitViewHeader(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Gap.large),
                      child: KitIconButton(
                        icon: MdiIcons.chevronLeft,
                        onPressed: () => context.navigator.pop(),
                      ),
                    ),
                    Text(
                      'Tags manual',
                      style: context.theme.textTheme.headline6,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: kHeaderHeight,
            bottom: 0,
            width: kMenuWidth,
            child: ColoredBox(
              color: context.theme.colorScheme.surfaceVariant,
              child: const ManualMenu(),
            ),
          ),
          Positioned(
            left: kMenuWidth,
            top: kHeaderHeight,
            right: 0,
            bottom: 0,
            child: Row(
              children: [
                Expanded(
                  child: KitViewContainer(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: kPadding,
                                bottom: kPadding,
                              ),
                              child: PageEditor(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: kPadding,
                              top: kPadding,
                              right: kPadding,
                              bottom: kPadding,
                            ),
                            child: PagePreviewWithFrame(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
