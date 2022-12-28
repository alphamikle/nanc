Future<void> wait([Duration duration = Duration.zero]) async {
  await Future<void>.delayed(duration);
}
