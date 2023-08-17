// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EventCWProxy {
  Event event(String event);

  Event meta(Map<String, Object?>? meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Event(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Event(...).copyWith(id: 12, name: "My name")
  /// ````
  Event call({
    String? event,
    Map<String, Object?>? meta,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEvent.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEvent.copyWith.fieldName(...)`
class _$EventCWProxyImpl implements _$EventCWProxy {
  const _$EventCWProxyImpl(this._value);

  final Event _value;

  @override
  Event event(String event) => this(event: event);

  @override
  Event meta(Map<String, Object?>? meta) => this(meta: meta);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Event(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Event(...).copyWith(id: 12, name: "My name")
  /// ````
  Event call({
    Object? event = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return Event(
      event: event == const $CopyWithPlaceholder() || event == null
          ? _value.event
          // ignore: cast_nullable_to_non_nullable
          : event as String,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as Map<String, Object?>?,
    );
  }
}

extension $EventCopyWith on Event {
  /// Returns a callable class that can be used as follows: `instanceOfEvent.copyWith(...)` or like so:`instanceOfEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EventCWProxy get copyWith => _$EventCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `Event(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Event(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  Event copyWithNull({
    bool meta = false,
  }) {
    return Event(
      event: event,
      meta: meta == true ? null : this.meta,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      event: json['event'] as String,
      meta: json['meta'] as Map<String, dynamic>? ?? Event.defaultMetaInfo,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'event': instance.event,
      'meta': instance.meta,
    };
