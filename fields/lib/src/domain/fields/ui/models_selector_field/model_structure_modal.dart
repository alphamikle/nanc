import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

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
      final List<dynamic> fields = structure['fields'];
      for (final field in fields) {
        final Json fieldJson = castToJson(field[0]);
        output.add(fieldJson['id'].toString());
      }
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return KitModalCard(
      onClose: () => context.navigator.pop(),
      header: Text('Fields of $modelName model'),
      child: Padding(
        padding: const EdgeInsets.only(bottom: Gap.large),
        child: KitJsonPreview(data: prettyStructure),
      ),
    );
  }
}
