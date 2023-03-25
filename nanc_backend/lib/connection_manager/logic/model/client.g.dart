// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientCWProxy {
  Client roomId(String roomId);

  Client status(ClientStatus status);

  Client serviceId(String serviceId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Client(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Client(...).copyWith(id: 12, name: "My name")
  /// ````
  Client call({
    String? roomId,
    ClientStatus? status,
    String? serviceId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClient.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClient.copyWith.fieldName(...)`
class _$ClientCWProxyImpl implements _$ClientCWProxy {
  const _$ClientCWProxyImpl(this._value);

  final Client _value;

  @override
  Client roomId(String roomId) => this(roomId: roomId);

  @override
  Client status(ClientStatus status) => this(status: status);

  @override
  Client serviceId(String serviceId) => this(serviceId: serviceId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Client(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Client(...).copyWith(id: 12, name: "My name")
  /// ````
  Client call({
    Object? roomId = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? serviceId = const $CopyWithPlaceholder(),
  }) {
    return Client(
      roomId: roomId == const $CopyWithPlaceholder() || roomId == null
          ? _value.roomId
          // ignore: cast_nullable_to_non_nullable
          : roomId as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ClientStatus,
      serviceId: serviceId == const $CopyWithPlaceholder() || serviceId == null
          ? _value.serviceId
          // ignore: cast_nullable_to_non_nullable
          : serviceId as String,
    );
  }
}

extension $ClientCopyWith on Client {
  /// Returns a callable class that can be used as follows: `instanceOfClient.copyWith(...)` or like so:`instanceOfClient.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientCWProxy get copyWith => _$ClientCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      roomId: json['roomId'] as String,
      status: $enumDecode(_$ClientStatusEnumMap, json['status']),
      serviceId: json['serviceId'] as String,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'status': _$ClientStatusEnumMap[instance.status]!,
      'serviceId': instance.serviceId,
    };

const _$ClientStatusEnumMap = {
  ClientStatus.unknown: 'unknown',
  ClientStatus.connecting: 'connecting',
  ClientStatus.connected: 'connected',
  ClientStatus.disconnected: 'disconnected',
};
