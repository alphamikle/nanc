import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../mapper/query_field_mapper.dart';

part 'query_and_field.dart';
part 'query_condition_field.dart';
part 'query_field.g.dart';
part 'query_or_field.dart';
part 'query_value_field.dart';

enum QueryFieldType {
  or('OR'),
  and('AND'),
  // textSearch('Search'),
  equals('Equals'),
  notEquals('Not equals'),
  startsWith('Starts with'),
  notStartsWith('Not starts with'),
  endsWith('Ends with'),
  notEndsWith('Not ends with'),
  contains('Contains'),
  notContains('Not contains'),
  empty('Empty', false),
  notEmpty('Not empty', false),
  less('Less'),
  lessOrEquals('Less or equals'),
  greater('Greater'),
  greaterOrEquals('Greater or equals'),
  isTrue('Is true', false),
  isFalse('Is false', false),
  isNull('Is null', false),
  isNotNull('Is not null', false),
  unknown('Unknown', false);

  const QueryFieldType(this.title, [this.needToShowValueField = true]);

  final String title;
  final bool needToShowValueField;

  static List<QueryFieldType> get valueTypes {
    return [
      // QueryFieldType.textSearch,
      QueryFieldType.equals,
      QueryFieldType.notEquals,
      QueryFieldType.startsWith,
      QueryFieldType.notStartsWith,
      QueryFieldType.endsWith,
      QueryFieldType.notEndsWith,
      QueryFieldType.contains,
      QueryFieldType.notContains,
      QueryFieldType.empty,
      QueryFieldType.notEmpty,
      QueryFieldType.less,
      QueryFieldType.lessOrEquals,
      QueryFieldType.greater,
      QueryFieldType.greaterOrEquals,
      QueryFieldType.isTrue,
      QueryFieldType.isFalse,
      QueryFieldType.isNull,
      QueryFieldType.isNotNull,
    ];
  }

  static List<QueryFieldType> get onlyNumericTypes {
    return [
      QueryFieldType.less,
      QueryFieldType.lessOrEquals,
      QueryFieldType.greater,
      QueryFieldType.greaterOrEquals,
    ];
  }

  static List<QueryFieldType> get onlyStringTypes {
    return [
      // QueryFieldType.textSearch,
      QueryFieldType.startsWith,
      QueryFieldType.notStartsWith,
      QueryFieldType.endsWith,
      QueryFieldType.notEndsWith,
      QueryFieldType.contains,
      QueryFieldType.notContains,
      QueryFieldType.empty,
      QueryFieldType.notEmpty,
    ];
  }

  static List<QueryFieldType> get onlyBoolTypes {
    return [
      QueryFieldType.isTrue,
      QueryFieldType.isFalse,
    ];
  }

  static List<QueryFieldType> get commonTypes {
    return [
      QueryFieldType.isNull,
      QueryFieldType.isNotNull,
    ];
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
sealed class QueryField extends Equatable {
  factory QueryField() => throw UnimplementedError();

  static const String typeKey = 'type';

  QueryFieldType get type;

  Json toJson();
}

extension EmptyQueryField on QueryField {
  bool get isConditionalAndEmpty {
    return this is QueryConditionField && (this as QueryConditionField).isEmpty;
  }
}
