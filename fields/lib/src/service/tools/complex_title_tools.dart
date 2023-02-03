import 'package:fields/src/domain/fields/logic/selector_field/title_fields.dart';

final RegExp possibleDelimiters = RegExp(r'[- .,_|]');

List<String> splitComplexTitle({required String query, required List<TitleField> titleFields}) {
  if (titleFields.length == 1) {
    return [query.trim()];
  }
  String preparedQuery = query;
  for (final TitleField titleField in titleFields) {
    if (titleField.isValid && (titleField is FieldsDecorator || titleField is FieldsDivider)) {
      preparedQuery = preparedQuery.replaceAll(titleField.strictValue, ' ');
    }
  }
  return preparedQuery.split(' ');
}
