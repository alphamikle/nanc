import 'package:flutter/material.dart';
import '../../../logic/constants/gap.dart';

class KitBaseModal extends StatelessWidget {
  const KitBaseModal({
    required this.header,
    required this.body,
    required this.bottom,
    this.width,
    this.height,
    super.key,
  });

  final Widget? header;
  final Widget? body;
  final Widget? bottom;
  final double? width;
  final double? height;

  static const double defaultWidth = 400;
  static const double defaultHeight = 300;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Gap.regular),
      child: SizedBox(
        width: width,
        height: height,
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (header != null)
                Padding(
                  padding: const EdgeInsets.only(left: Gap.large, top: Gap.large, right: Gap.large),
                  child: header,
                ),
              if (body != null)
                Padding(
                  padding: const EdgeInsets.only(left: Gap.large, right: Gap.large),
                  child: body!,
                ),
              if (bottom != null)
                Padding(
                  padding: const EdgeInsets.only(left: Gap.large, top: Gap.large, right: Gap.large, bottom: Gap.large),
                  child: bottom,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
