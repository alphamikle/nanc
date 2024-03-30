import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../ui_kit/domain/ui/components/kit_code_preview/kit_json_preview.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_modal.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';

class ModelStructureModal extends StatelessWidget {
  const ModelStructureModal({
    required this.modelName,
    required this.structure,
    super.key,
  });

  final String modelName;
  final Json structure;

  List<String> get prettyStructure {
    final List<String> output = [];
    if (structure.containsKey('fields') && structure['fields'] is List) {
      final List<dynamic> flattedFields = [];
      final List<dynamic> fields = structure['fields'] as List<dynamic>;
      for (final dynamic fieldsRow in fields) {
        if (fieldsRow is List<dynamic>) {
          flattedFields.addAll(fieldsRow);
        }
      }
      for (final dynamic field in flattedFields) {
        final Json fieldJson = castToJson(field);
        output.add(fieldJson['id'].toString());
      }
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return KitModal(
      onClose: () => context.navigator.pop(),
      header: Text('Fields of $modelName model'),
      child: Padding(
        padding: const EdgeInsets.only(bottom: Gap.large),
        child: KitJsonPreview(data: prettyStructure),
      ),
    );
  }
}
