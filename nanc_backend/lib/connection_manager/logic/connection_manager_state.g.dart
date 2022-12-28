// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_manager_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConnectionManagerStateCWProxy {
  ConnectionManagerState clients(List<Client> clients);

  ConnectionManagerState freshRoomId(String freshRoomId);

  ConnectionManagerState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConnectionManagerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConnectionManagerState(...).copyWith(id: 12, name: "My name")
  /// ````
  ConnectionManagerState call({
    List<Client>? clients,
    String? freshRoomId,
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConnectionManagerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConnectionManagerState.copyWith.fieldName(...)`
class _$ConnectionManagerStateCWProxyImpl
    implements _$ConnectionManagerStateCWProxy {
  final ConnectionManagerState _value;

  const _$ConnectionManagerStateCWProxyImpl(this._value);

  @override
  ConnectionManagerState clients(List<Client> clients) =>
      this(clients: clients);

  @override
  ConnectionManagerState freshRoomId(String freshRoomId) =>
      this(freshRoomId: freshRoomId);

  @override
  ConnectionManagerState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConnectionManagerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConnectionManagerState(...).copyWith(id: 12, name: "My name")
  /// ````
  ConnectionManagerState call({
    Object? clients = const $CopyWithPlaceholder(),
    Object? freshRoomId = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return ConnectionManagerState(
      clients: clients == const $CopyWithPlaceholder() || clients == null
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as List<Client>,
      freshRoomId:
          freshRoomId == const $CopyWithPlaceholder() || freshRoomId == null
              ? _value.freshRoomId
              // ignore: cast_nullable_to_non_nullable
              : freshRoomId as String,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $ConnectionManagerStateCopyWith on ConnectionManagerState {
  /// Returns a callable class that can be used as follows: `instanceOfConnectionManagerState.copyWith(...)` or like so:`instanceOfConnectionManagerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConnectionManagerStateCWProxy get copyWith =>
      _$ConnectionManagerStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionManagerState _$ConnectionManagerStateFromJson(
        Map<String, dynamic> json) =>
    ConnectionManagerState(
      isLoading: json['isLoading'] as bool,
      freshRoomId: json['freshRoomId'] as String,
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ConnectionManagerStateToJson(
        ConnectionManagerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'freshRoomId': instance.freshRoomId,
      'clients': instance.clients.map((e) => e.toJson()).toList(),
    };
