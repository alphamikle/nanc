class EventBusResponse<T> {
  const EventBusResponse({
    this.data,
    this.error,
  }) : assert(data == null || error == null, 'The error or a data must been null');

  final T? data;
  final Object? error;

  T get sureData => data!;

  bool get hasData => data != null;

  bool get hasError => error != null;

  bool get isEmpty => !hasData && !hasError;

  EventBusResponse<R> cast<R>() {
    if (hasData) {
      if (data is! R) {
        throw Exception('Data type "${data.runtimeType}" is not a required type "$R"');
      }
      return EventBusResponse<R>(data: data as R);
    }
    return EventBusResponse<R>(error: error);
  }
}
