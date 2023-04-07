import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'page_state.g.dart';

const List<String> _uiFields = [
  'screen',
  'ui',
  'page',
  'interface',
  'markup',
  'view',
];

@autoequal
@CopyWith()
@JsonSerializable()
class PageState extends Equatable {
  const PageState({
    required this.isLoading,
    required this.isConnectingToTheBackend,
    required this.isConnectedToTheBackend,
    required this.pageData,
    required this.alwaysUpdate,
  });

  factory PageState.empty() => const PageState(
        isLoading: false,
        isConnectingToTheBackend: false,
        isConnectedToTheBackend: false,
        pageData: <String, dynamic>{},
        alwaysUpdate: false,
      );

  final bool isLoading;
  final bool isConnectingToTheBackend;
  final bool isConnectedToTheBackend;
  final Json pageData;
  final bool alwaysUpdate;

  String get screenData {
    for (final String uiFieldName in _uiFields) {
      final dynamic screenData = pageData[uiFieldName];
      if (screenData != null) {
        if (screenData is String) {
          return screenData;
        } else if (screenData is Map && screenData['content'] is String) {
          return screenData['content'] as String;
        }
      }
    }
    return '';
  }

  @override
  List<Object?> get props => _$props;
}
