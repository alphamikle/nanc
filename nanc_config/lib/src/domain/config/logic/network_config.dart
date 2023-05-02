class NetworkConfig {
  const NetworkConfig({
    required this.paginationLimitParameterName,
    required this.paginationPageNumberParameterName,
    this.paginationLimitParameterDefaultValue = 50,
  });

  final String paginationLimitParameterName;
  final String paginationPageNumberParameterName;
  final int paginationLimitParameterDefaultValue;
}
