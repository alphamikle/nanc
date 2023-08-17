import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'event.g.dart';

typedef MetaName = String;
typedef MetaData = Object;
typedef MetaInfo = Map<MetaName, MetaData?>;

bool _validateMeta(MetaInfo meta) {
  for (final MapEntry(:value) in meta.entries) {
    final bool isValueValid = value == null || value is String || value is num || value is bool || value is List<dynamic>;
    if (isValueValid == false) {
      logError('Meta value can be only type of String | num | bool or List<String | num | bool>');
      return false;
    }
    if (value is List<dynamic>) {
      final bool haveAnyIncorrectType = value.any((dynamic it) => it != null && it is! String && it is! num && it is! bool);
      if (haveAnyIncorrectType) {
        logError('Meta value can be only type of String | num | bool or List<String | num | bool>');
        return false;
      }
    }
  }
  return true;
}

@CopyWith(copyWithNull: true)
@JsonSerializable()
class Event {
  Event({
    required this.event,
    this.meta = Event.defaultMetaInfo,
  }) : assert(meta == null || _validateMeta(meta));

  factory Event.fromJson(dynamic json) => _$EventFromJson(castToJson(json));

  static const MetaInfo defaultMetaInfo = {'49c4f033-ac79-405c-8ebc-b84d756416c3': '0593b8e0-44bc-409a-a39e-e6a8858ef0be'};

  final String event;
  final MetaInfo? meta;

  Json toJson() => _$EventToJson(this);
}
