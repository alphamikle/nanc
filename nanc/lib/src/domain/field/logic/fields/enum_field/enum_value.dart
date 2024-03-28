import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'enum_value.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class EnumValue extends Equatable {
  const EnumValue({
    required this.title,
    required this.value,
  });

  factory EnumValue.fromJson(dynamic json) => _$EnumValueFromJson(castToJson(json));

  final String title;
  final Object value;

  T typedValue<T>() => value as T;

  Json toJson() => _$EnumValueToJson(this);

  @override
  List<Object?> get props => _$props;
}
