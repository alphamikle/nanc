// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessageCWProxy {
  Message messageType(String messageType);

  Message messageId(String messageId);

  Message payload(Object? payload);

  Message isError(bool isError);

  Message isResponse(bool isResponse);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Message(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Message(...).copyWith(id: 12, name: "My name")
  /// ````
  Message call({
    String? messageType,
    String? messageId,
    Object? payload,
    bool? isError,
    bool? isResponse,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMessage.copyWith.fieldName(...)`
class _$MessageCWProxyImpl implements _$MessageCWProxy {
  const _$MessageCWProxyImpl(this._value);

  final Message _value;

  @override
  Message messageType(String messageType) => this(messageType: messageType);

  @override
  Message messageId(String messageId) => this(messageId: messageId);

  @override
  Message payload(Object? payload) => this(payload: payload);

  @override
  Message isError(bool isError) => this(isError: isError);

  @override
  Message isResponse(bool isResponse) => this(isResponse: isResponse);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Message(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Message(...).copyWith(id: 12, name: "My name")
  /// ````
  Message call({
    Object? messageType = const $CopyWithPlaceholder(),
    Object? messageId = const $CopyWithPlaceholder(),
    Object? payload = const $CopyWithPlaceholder(),
    Object? isError = const $CopyWithPlaceholder(),
    Object? isResponse = const $CopyWithPlaceholder(),
  }) {
    return Message(
      messageType:
          messageType == const $CopyWithPlaceholder() || messageType == null
              ? _value.messageType
              // ignore: cast_nullable_to_non_nullable
              : messageType as String,
      messageId: messageId == const $CopyWithPlaceholder() || messageId == null
          ? _value.messageId
          // ignore: cast_nullable_to_non_nullable
          : messageId as String,
      payload: payload == const $CopyWithPlaceholder()
          ? _value.payload
          // ignore: cast_nullable_to_non_nullable
          : payload as Object?,
      isError: isError == const $CopyWithPlaceholder() || isError == null
          ? _value.isError
          // ignore: cast_nullable_to_non_nullable
          : isError as bool,
      isResponse:
          isResponse == const $CopyWithPlaceholder() || isResponse == null
              ? _value.isResponse
              // ignore: cast_nullable_to_non_nullable
              : isResponse as bool,
    );
  }
}

extension $MessageCopyWith on Message {
  /// Returns a callable class that can be used as follows: `instanceOfMessage.copyWith(...)` or like so:`instanceOfMessage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MessageCWProxy get copyWith => _$MessageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      messageType: json['messageType'] as String,
      messageId: json['messageId'] as String,
      payload: json['payload'],
      isError: json['isError'] as bool? ?? false,
      isResponse: json['isResponse'] as bool? ?? false,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'messageType': instance.messageType,
      'messageId': instance.messageId,
      'payload': instance.payload,
      'isError': instance.isError,
      'isResponse': instance.isResponse,
    };
