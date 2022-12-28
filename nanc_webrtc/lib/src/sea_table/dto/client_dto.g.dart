// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientDtoCWProxy {
  ClientDto answer(Map<String, dynamic> answer);

  ClientDto candidates(List<Map<String, dynamic>> candidates);

  ClientDto createdAt(DateTime createdAt);

  ClientDto id(int id);

  ClientDto isConnected(bool isConnected);

  ClientDto roomId(String roomId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientDto call({
    Map<String, dynamic>? answer,
    List<Map<String, dynamic>>? candidates,
    DateTime? createdAt,
    int? id,
    bool? isConnected,
    String? roomId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientDto.copyWith.fieldName(...)`
class _$ClientDtoCWProxyImpl implements _$ClientDtoCWProxy {
  final ClientDto _value;

  const _$ClientDtoCWProxyImpl(this._value);

  @override
  ClientDto answer(Map<String, dynamic> answer) => this(answer: answer);

  @override
  ClientDto candidates(List<Map<String, dynamic>> candidates) =>
      this(candidates: candidates);

  @override
  ClientDto createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  ClientDto id(int id) => this(id: id);

  @override
  ClientDto isConnected(bool isConnected) => this(isConnected: isConnected);

  @override
  ClientDto roomId(String roomId) => this(roomId: roomId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientDto(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientDto call({
    Object? answer = const $CopyWithPlaceholder(),
    Object? candidates = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? isConnected = const $CopyWithPlaceholder(),
    Object? roomId = const $CopyWithPlaceholder(),
  }) {
    return ClientDto(
      answer: answer == const $CopyWithPlaceholder() || answer == null
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as Map<String, dynamic>,
      candidates:
          candidates == const $CopyWithPlaceholder() || candidates == null
              ? _value.candidates
              // ignore: cast_nullable_to_non_nullable
              : candidates as List<Map<String, dynamic>>,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      isConnected:
          isConnected == const $CopyWithPlaceholder() || isConnected == null
              ? _value.isConnected
              // ignore: cast_nullable_to_non_nullable
              : isConnected as bool,
      roomId: roomId == const $CopyWithPlaceholder() || roomId == null
          ? _value.roomId
          // ignore: cast_nullable_to_non_nullable
          : roomId as String,
    );
  }
}

extension $ClientDtoCopyWith on ClientDto {
  /// Returns a callable class that can be used as follows: `instanceOfClientDto.copyWith(...)` or like so:`instanceOfClientDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientDtoCWProxy get copyWith => _$ClientDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientDto _$ClientDtoFromJson(Map<String, dynamic> json) => ClientDto(
      id: json['id'] as int,
      roomId: json['room_id'] as String,
      candidates: listOfJsonFromDynamic(json['candidates']),
      answer: jsonFromDynamic(json['answer']),
      isConnected: json['is_connected'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ClientDtoToJson(ClientDto instance) => <String, dynamic>{
      'id': instance.id,
      'room_id': instance.roomId,
      'candidates': somethingToString(instance.candidates),
      'answer': somethingToString(instance.answer),
      'is_connected': instance.isConnected,
      'created_at': instance.createdAt.toIso8601String(),
    };
