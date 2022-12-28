class AdminConfig {
  const AdminConfig({
    required this.limitPerPageParameterName,
    required this.pageNumberParameterName,
    this.defaultLimitPerPage = 50,
  });

  final String limitPerPageParameterName;
  final String pageNumberParameterName;
  final int defaultLimitPerPage;
}
