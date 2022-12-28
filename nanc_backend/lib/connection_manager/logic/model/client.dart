import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'client.g.dart';

enum ClientStatus {
  unknown,
  connecting,
  connected,
  disconnected,
}

@CopyWith()
@JsonSerializable()
class Client extends Equatable {
  const Client({
    required this.roomId,
    required this.status,
    required this.serviceId,
  });

  factory Client.fromJson(dynamic json) => _$ClientFromJson(castToJson(json));

  final String roomId;
  final ClientStatus status;
  final String serviceId;

  bool get isActive => status == ClientStatus.connected;

  Json toJson() => _$ClientToJson(this);

  @override
  List<Object?> get props => [
        roomId,
        status,
        serviceId,
      ];
}
