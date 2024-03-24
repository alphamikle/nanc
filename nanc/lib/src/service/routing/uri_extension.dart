typedef QueryParameters = Map<String, String>;

extension UriExtension on Uri {
  Uri copyWith({
    String? fragment,
    String? host,
    String? path,
    int? port,
    String? query,
    QueryParameters? queryParameters,
    String? scheme,
    String? userInfo,
  }) {
    return Uri(
      fragment: fragment ?? this.fragment,
      host: host ?? this.host,
      path: path ?? this.path,
      port: port ?? this.port,
      query: query ?? this.query,
      queryParameters: queryParameters ?? this.queryParameters,
      scheme: scheme ?? this.scheme,
      userInfo: userInfo ?? userInfo,
    );
  }
}
