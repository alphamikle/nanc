import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_buttons/kit_icon_button.dart';
import 'package:ui_kit/src/components/kit_tooltip.dart';
import 'package:ui_kit/src/constants/gap.dart';

const double _kHSize = 0.90;
const double _kWSize = 0.75;

class KitModalCard extends StatelessWidget {
  const KitModalCard({
    required this.child,
    required this.onClose,
    this.header,
    super.key,
  });

  final Widget child;
  final VoidCallback onClose;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * _kWSize;
    final double height = MediaQuery.of(context).size.height * _kHSize;
    const BorderRadius radius = BorderRadius.all(Radius.circular(Gap.regular));

    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: radius,
          child: Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Gap.large, vertical: Gap.regular),
                  child: Row(
                    children: [
                      if (header != null)
                        DefaultTextStyle(
                          style: context.theme.textTheme.headline6 ?? const TextStyle(),
                          child: header!,
                        ),
                      const Spacer(),
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
