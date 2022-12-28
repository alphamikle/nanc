class EventBusRequest<T> {
  const EventBusRequest({
    required this.eventId,
    required this.eventHash,
    this.data,
  });

  final Object eventId;
  final String eventHash;
  final T? data;

  T get sureData => data!;

  bool get hasData => data != null;
}
