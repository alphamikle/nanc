// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostDtoCWProxy {
  HostDto candidates(List<Map<String, dynamic>> candidates);

  HostDto createdAt(DateTime createdAt);

  HostDto hasConnectedClients(bool hasConnectedClients);

  HostDto id(int id);

  HostDto offer(Map<String, dynamic> offer);

  HostDto roomId(String roomId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostDto(...).copyWith(id: 12, name: "My name")
  /// ````
  HostDto call({
    List<Map<String, dynamic>>? candidates,
    DateTime? createdAt,
    bool? hasConnectedClients,
    int? id,
    Map<String, dynamic>? offer,
    String? roomId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHostDto.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHostDto.copyWith.fieldName(...)`
class _$HostDtoCWProxyImpl implements _$HostDtoCWProxy {
  final HostDto _value;

  const _$HostDtoCWProxyImpl(this._value);

  @override
  HostDto candidates(List<Map<String, dynamic>> candidates) =>
      this(candidates: candidates);

  @override
  HostDto createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  HostDto hasConnectedClients(bool hasConnectedClients) =>
      this(hasConnectedClients: hasConnectedClients);

  @override
  HostDto id(int id) => this(id: id);

  @override
  HostDto offer(Map<String, dynamic> offer) => this(offer: offer);

  @override
  HostDto roomId(String roomId) => this(roomId: roomId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostDto(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostDto(...).copyWith(id: 12, name: "My name")
  /// ````
  HostDto call({
    Object? candidates = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? hasConnectedClients = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? offer = const $CopyWithPlaceholder(),
    Object? roomId = const $CopyWithPlaceholder(),
  }) {
    return HostDto(
      candidates:
          candidates == const $CopyWithPlaceholder() || candidates == null
              ? _value.candidates
              // ignore: cast_nullable_to_non_nullable
              : candidates as List<Map<String, dynamic>>,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      hasConnectedClients:
          hasConnectedClients == const $CopyWithPlaceholder() ||
                  hasConnectedClients == null
              ? _value.hasConnectedClients
              // ignore: cast_nullable_to_non_nullable
              : hasConnectedClients as bool,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      offer: offer == const $CopyWithPlaceholder() || offer == null
          ? _value.offer
          // ignore: cast_nullable_to_non_nullable
          : offer as Map<String, dynamic>,
      roomId: roomId == const $CopyWithPlaceholder() || roomId == null
          ? _value.roomId
          // ignore: cast_nullable_to_non_nullable
          : roomId as String,
    );
  }
}

extension $HostDtoCopyWith on HostDto {
  /// Returns a callable class that can be used as follows: `instanceOfHostDto.copyWith(...)` or like so:`instanceOfHostDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostDtoCWProxy get copyWith => _$HostDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostDto _$HostDtoFromJson(Map<String, dynamic> json) => HostDto(
      id: json['id'] as int,
      roomId: json['room_id'] as String,
      offer: jsonFromDynamic(json['offer']),
      candidates: listOfJsonFromDynamic(json['candidates']),
      hasConnectedClients: json['has_connected_clients'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$HostDtoToJson(HostDto instance) => <String, dynamic>{
      'id': instance.id,
      'room_id': instance.roomId,
      'offer': somethingToString(instance.offer),
      'candidates': somethingToString(instance.candidates),
      'has_connected_clients': instance.hasConnectedClients,
      'created_at': instance.createdAt.toIso8601String(),
    };
