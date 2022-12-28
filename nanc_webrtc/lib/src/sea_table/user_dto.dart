import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'user_dto.g.dart';

@JsonSerializable()
@CopyWith()
class UserDto {
  const UserDto({
    required this.id,
    required this.email,
    required this.confirmed,
  });

  factory UserDto.fromJson(dynamic json) => _$UserDtoFromJson(castToJson(json));

  final String id;
  final String email;
  final bool confirmed;

  Json toJson() => _$UserDtoToJson(this);
}
