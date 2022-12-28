import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_divider.dart';
import 'package:ui_kit/src/components/kit_line.dart';
import 'package:ui_kit/src/components/kit_modal/kit_base_modal.dart';
import 'package:ui_kit/src/components/kit_modal/kit_base_modal_bottom.dart';
import 'package:ui_kit/src/constants/gap.dart';

typedef ModalWrapper = Widget Function(BuildContext context, Widget child);

class KitConfirmModal extends StatelessWidget {
  const KitConfirmModal({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KitBaseModal(
        width: 600,
        header: Padding(
          padding: const EdgeInsets.only(bottom: Gap.large),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.theme.textTheme.headline6,
              ),
              KitDivider.vertical(Gap.large),
              const KitLine(useGradient: false, opacity: 0.25),
            ],
          ),
        ),
        body: subtitle == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(top: Gap.regular, bottom: Gap.regular),
                child: Text(subtitle!),
              ),
        bottom: KitBaseModalBottom(
          onOk: () => context.navigator.pop(true),
          onCancel: () => context.navigator.pop(false),
        ),
      ),
    );
  }
}

Future<bool> confirmAction({
  required BuildContext context,
  required String title,
  ModalWrapper? wrapper,
  String? subtitle,
}) async {
  Widget modal = KitConfirmModal(
    title: title,
    subtitle: subtitle,
  );
  if (wrapper != null) {
    modal = wrapper(context, modal);
  }

  final bool? result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => modal,
  );
  return result ?? false;
}
