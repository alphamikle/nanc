import 'package:flutter_test/flutter_test.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tools/chain_extractor.dart';
import 'package:nanc_tools/nanc_tools.dart';

void main() {
  group('Chain Extractor Tests', () {
    test('Update values', () {
      final Json updatedJson = updateValueByChain({}, 150, 'user.age'.split('.'));

      expect(
        updatedJson,
        equals(
          {
            'user': {'age': 150}
          },
        ),
      );
    });

    test('Set nulls | Remove values', () {
      final Json initialJson = {
        'first': 1,
        'second': 2,
        'third': {
          'fourth': {
            'user': {'age': 150},
          }
        }
      };

      final Json updatedJson = updateValueByChain(initialJson, null, 'third.fourth.user.age'.split('.'));

      expect(
        updatedJson,
        equals(
          {
            'first': 1,
            'second': 2,
          },
        ),
      );
    });

    test('Set nulls | Remove values', () {
      final Json initialJson = {
        'first': 1,
        'second': 2,
        'third': {
          'fourth': {
            'user': {'age': 150},
          }
        }
      };

      final Json updatedJson = updateValueByChain(initialJson, null, 'third.fourth.user.age.salem'.split('.'));

      expect(
        updatedJson,
        equals(initialJson),
      );
    });
  });
}
