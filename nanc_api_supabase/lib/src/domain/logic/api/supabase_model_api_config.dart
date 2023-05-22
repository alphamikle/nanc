class SupabaseModelApiConfig {
  const SupabaseModelApiConfig({
    required this.executorFunctionName,
    required this.executorSqlArgumentName,
    required this.executorReturnableArgumentName,
    required this.changeDifferentTypes,
    required this.deleteUnnecessaryColumns,
  });

  final String executorFunctionName;
  final String executorSqlArgumentName;
  final String executorReturnableArgumentName;
  final bool changeDifferentTypes;
  final bool deleteUnnecessaryColumns;
}
