import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import 'field_card.dart';

class FieldTypeSelectorModal extends StatelessWidget {
  const FieldTypeSelectorModal({
    this.include,
    this.exclude,
    super.key,
  });

  final Set<FieldType>? include;
  final Set<FieldType>? exclude;

  List<Field> get _fields {
    final List<Field> fields = [];
    for (int i = 0; i < FieldMapper.customerFields.length; i++) {
      final Field field = FieldMapper.customerFields[i];
      final bool isIncluded = include == null || include!.isEmpty || include!.contains(field.type);
      final bool isExcluded = exclude != null && exclude!.isNotEmpty && exclude!.contains(field.type);
      if (isIncluded && isExcluded == false) {
        fields.add(field);
      }
    }
    return fields;
  }

  Widget fieldCardBuilder(BuildContext context, int index) {
    final Field field = _fields[index];
    return FieldCard(
      field: field,
      creationMode: true,
      onPressed: () => context.navigator.pop(field.type),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KitModal(
      header: const KitText(text: 'Select field type'),
      onClose: () => context.navigator.pop(null),
      child: Column(
        children: [
          const KitPreloaderV2(isLoading: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: Gap.regular, right: Gap.regular),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: KitDivider(height: Gap.regular),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      fieldCardBuilder,
                      childCount: _fields.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Gap.regular,
                      mainAxisSpacing: Gap.regular,
                      mainAxisExtent: FieldCard.height,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: KitDivider.vertical(Gap.regular),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<FieldType?> showFieldTypeSelectorModal(
  BuildContext context, {
  Set<FieldType>? include,
  Set<FieldType>? exclude,
}) async {
  final FieldType? result = await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => FieldTypeSelectorModal(
      include: include,
      exclude: exclude,
    ),
  );
  return result;
}
