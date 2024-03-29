// ignore_for_file: prefer_initializing_formals

class NetworkConfig {
  NetworkConfig({
    required String paginationLimitParameterName,
    required String paginationPageNumberParameterName,
    required String paginationDataContainerParameterName,
    required String paginationTotalPagesParameterName,
    int paginationLimitParameterDefaultValue = 50,
  }) {
    /// ? This is the way to force user to init network config and in the same time to have flexibility and being able to change it later dynamically
    NetworkConfig.paginationLimitParameterName = paginationLimitParameterName;
    NetworkConfig.paginationPageNumberParameterName = paginationPageNumberParameterName;
    NetworkConfig.paginationDataContainerParameterName = paginationDataContainerParameterName;
    NetworkConfig.paginationTotalPagesParameterName = paginationTotalPagesParameterName;
    NetworkConfig.paginationLimitParameterDefaultValue = paginationLimitParameterDefaultValue;
  }

  NetworkConfig.simple({int paginationLimitParameterDefaultValue = 100}) {
    NetworkConfig.paginationLimitParameterName = 'limit';
    NetworkConfig.paginationPageNumberParameterName = 'page';
    NetworkConfig.paginationDataContainerParameterName = 'data';
    NetworkConfig.paginationTotalPagesParameterName = 'total_pages';
    NetworkConfig.paginationLimitParameterDefaultValue = paginationLimitParameterDefaultValue;
  }

  /// ? Examples of parameter: ["limit", "per_page", "itemsPerPage", etc.]
  static late String paginationLimitParameterName;

  /// ? Examples: ["page", "page_number", etc.]
  static late String paginationPageNumberParameterName;

  /// ? Examples: ["data", "values", "objects", etc.]
  static late String paginationDataContainerParameterName;

  /// ? Examples: ["total", "total_items", "overall", etc.]
  static late String paginationTotalPagesParameterName;
  static late int paginationLimitParameterDefaultValue;
}

extension ExtraGetters on NetworkConfig {
  String get paginationLimitParameterName => NetworkConfig.paginationLimitParameterName;
  String get paginationPageNumberParameterName => NetworkConfig.paginationPageNumberParameterName;
  String get paginationDataContainerParameterName => NetworkConfig.paginationDataContainerParameterName;
  String get paginationTotalPagesParameterName => NetworkConfig.paginationTotalPagesParameterName;
  int get paginationLimitParameterDefaultValue => NetworkConfig.paginationLimitParameterDefaultValue;
}
