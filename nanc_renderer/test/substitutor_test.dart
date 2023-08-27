import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/logic/document_storage.dart';
import 'package:nanc_renderer/src/domain/logic/tags/logic/for_storage.dart';
import 'package:nanc_renderer/src/domain/logic/tags/logic/substitutor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/logic/template_storage.dart';
import 'package:tools/tools.dart';

import 'data/substitutor_data.dart';

void main() {
  group('Substitutor tests', () {
    test('Extraction of expressions', () async {
      final Substitutor substitutor = createSubstitutor();
      substitutor.substitute('', firstCase);
      expect(substitutor.testExpressions.length, 4);
    });

    test('Evaluation of expressions', () async {
      final Substitutor substitutor = createSubstitutor(
        pData: {
          'user': {
            'name': 'Mike',
          },
        },
      );
      final String result = substitutor.substitute('', firstCase);
      expect(result, firstResult);
    });
  });
}

Substitutor createSubstitutor({
  Json? data,
  Json? pData,
}) {
  final DataStorage dataStorage = DataStorage(data: data ?? {});
  final TemplateStorage templateStorage = TemplateStorage(child: const SizedBox.shrink());
  // ignore: prefer_const_constructors
  final DocumentStorage pageData = DocumentStorage(
    data: pData ?? {},
    child: const SizedBox.shrink(),
  );
  final ForStorage forStorage = ForStorage(child: const SizedBox.shrink());

  return Substitutor.test(
    dataStorage: dataStorage,
    templateStorage: templateStorage,
    pageData: pageData,
    forStorage: forStorage,
  );
}
