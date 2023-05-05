import 'package:json_annotation/json_annotation.dart';

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
  empty('Empty'),
  notEmpty('Not empty'),
  less('Less'),
  lessOrEquals('Less or equals'),
  greater('Greater'),
  greaterOrEquals('Greater or equals'),
  isTrue('Is true'),
  isFalse('Is false'),
  unknown('Unknown');

  final String title;

  const QueryFieldType(this.title);

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
    ];
  }
}

@JsonSerializable()
abstract class QueryField {
  factory QueryField() => throw UnimplementedError();

  static const String typeKey = 'type';

  QueryFieldType get type;
}
