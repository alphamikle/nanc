import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:renderer/src/domain/logic/widgets_builder/widgets_builder.dart';
import 'package:renderer/src/domain/logic/widgets_xml_generator/widgets_xml_generator.dart';

import 'testContent.dart';

void main() {
  group('XML Renderer Test', () {
    test('Async widgets generation', () async {
      final List<Widget> widgets = await WidgetsXmlGenerator(
        xml: testContent,
        widgetsBuilder: WidgetsBuilder(
          builders: {},
        ),
      ).generate().last;
      expect(widgets.isNotEmpty, true);
    });
  });
}
