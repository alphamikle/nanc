import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import 'model/client.dart';

part 'connection_manager_state.g.dart';

@CopyWith()
@JsonSerializable()
class ConnectionManagerState extends Equatable {
  const ConnectionManagerState({
    required this.isLoading,
    required this.freshRoomId,
    required this.clients,
  });

  factory ConnectionManagerState.empty() => const ConnectionManagerState(isLoading: false, freshRoomId: '', clients: []);

  factory ConnectionManagerState.fromJson(dynamic json) => _$ConnectionManagerStateFromJson(castToJson(json));

  final bool isLoading;
  final String freshRoomId;
  final List<Client> clients;

  bool get hasAnyClient => clients.isNotEmpty;

  bool get isEmptyId => freshRoomId.isEmpty;

  bool get isNotEmptyId => freshRoomId.isNotEmpty;

  Json toJson() => _$ConnectionManagerStateToJson(this);

  @override
  List<Object?> get props => [
        isLoading,
        freshRoomId,
        clients,
      ];
}
