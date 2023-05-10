import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'query_field.g.dart';

enum QueryFieldType {
  or('OR'),
  and('AND'),
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

  final String title;
  final bool needToShowValueField;

  const QueryFieldType(this.title, [this.needToShowValueField = true]);

  static List<QueryFieldType> get valueTypes {
    return [
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
abstract class QueryField extends Equatable {
  factory QueryField() => throw UnimplementedError();

  static const String typeKey = 'type';

  QueryFieldType get type;

  Json toJson();
}
