import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../logic/constants/gap.dart';
import '../kit_buttons/kit_icon_button.dart';
import '../kit_tooltip.dart';

const double _kHSize = 0.90;
const double _kWSize = 0.75;

class KitModal extends StatelessWidget {
  const KitModal({
    required this.child,
    required this.onClose,
    this.header,
    this.headerSuffix,
    super.key,
  });

  final Widget child;
  final VoidCallback onClose;
  final Widget? header;
  final Widget? headerSuffix;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * _kWSize;
    final double height = MediaQuery.of(context).size.height * _kHSize;
    const BorderRadius radius = BorderRadius.all(Radius.circular(Gap.regular));

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Gap.large, vertical: Gap.regular),
                  child: Row(
                    children: [
                      if (header != null)
                        DefaultTextStyle(
                          style: context.theme.textTheme.titleLarge ?? const TextStyle(),
                          child: header!,
                        ),
                      const Spacer(),
                      if (headerSuffix != null) headerSuffix!,
                      Material(
                        child: KitTooltip(
                          text: 'Close',
                          child: KitIconButton(
                            icon: IconPack.mdi_window_close,
                            onPressed: onClose,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
