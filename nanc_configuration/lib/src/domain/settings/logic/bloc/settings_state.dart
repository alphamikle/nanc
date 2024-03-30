import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'settings_state.g.dart';

typedef FieldIndex = int;
typedef FieldWidth = double;
typedef TableWidth = Map<FieldIndex, FieldWidth>;
typedef TablesWidths = Map<ModelId, TableWidth>;

@autoequal
@CopyWith()
@JsonSerializable()
class SettingsState extends Equatable {
  const SettingsState({
    required this.tablesWidths,
  });

  factory SettingsState.empty() => const SettingsState(tablesWidths: {});

  factory SettingsState.fromJson(dynamic json) => _$SettingsStateFromJson(castToJson(json));

  final TablesWidths tablesWidths;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$SettingsStateToJson(this);
}
