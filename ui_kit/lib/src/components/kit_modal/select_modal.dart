import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../constants/gap.dart';
import '../kit_buttons/kit_button.dart';
import '../kit_divider.dart';
import '../kit_line.dart';
import '../kit_text.dart';
import 'confirm_modal.dart';
import 'kit_base_modal.dart';

class SelectValue<T> {
  const SelectValue({
    required this.value,
    required this.title,
    required this.color,
  });

  final T value;
  final String title;
  final Color color;
}

class KitSelectModal<T> extends StatelessWidget {
  const KitSelectModal({
    required this.title,
    required this.subtitle,
    required this.values,
    super.key,
  });

  final String title;
  final String? subtitle;
  final List<SelectValue<T>> values;

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
              KitText(
                text: title,
                style: context.theme.textTheme.titleLarge,
              ),
              if (subtitle != null) KitDivider.vertical(Gap.large),
              if (subtitle != null) const KitLine(useGradient: false, opacity: 0.25),
            ],
          ),
        ),
        body: subtitle == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(top: Gap.regular, bottom: Gap.regular),
                child: KitText(text: subtitle!),
              ),
        bottom: SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: values.map((SelectValue<T> value) {
              return Padding(
                padding: const EdgeInsets.only(right: Gap.large),
                child: KitButton(
                  text: value.title,
                  color: value.color,
                  onPressed: () => context.navigator.pop(value.value),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

Future<T> selectAction<T>({
  required BuildContext context,
  required String title,
  required List<SelectValue<T>> values,
  ModalWrapper? wrapper,
  String? subtitle,
}) async {
  Widget modal = KitSelectModal<T>(
    title: title,
    subtitle: subtitle,
    values: values,
  );
  if (wrapper != null) {
    modal = wrapper(context, modal);
  }

  final T result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => modal,
  );
  return result;
}
