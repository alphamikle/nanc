class HumanException implements Exception {
  const HumanException({
    required this.humanMessage,
    required this.originalMessage,
    required this.stackTrace,
  });

  factory HumanException.fromError({
    required String humanMessage,
    required Object? error,
  }) {
    String? message;
    StackTrace? stackTrace;
    if (error is Error) {
      message = error.toString();
      stackTrace = error.stackTrace;
    } else if (error is List<dynamic> && error.length == 2) {
      final Object? listError = error.first;
      final Object? listStackTrace = error.last;
      if (listError is Error) {
        message = error.toString();
      }
      if (listStackTrace is StackTrace) {
        stackTrace = listStackTrace;
      }
    } else {
      message = error.toString();
    }
    message = message?.replaceFirst('Exception: ', '');

    return HumanException(
      humanMessage: humanMessage,
      originalMessage: message,
      stackTrace: stackTrace,
    );
  }

  final String humanMessage;
  final String? originalMessage;
  final StackTrace? stackTrace;

  String get additionalInfo => '${hasOriginalMessage ? '$originalMessage' : ''}${hasStackTrace ? '${hasOriginalMessage ? '\n\n' : ''}$stackTrace' : ''}';

  bool get hasOriginalMessage => originalMessage != null && originalMessage!.trim().isNotEmpty;
  bool get hasStackTrace => stackTrace != null;

  @override
  String toString() => humanMessage;
}

extension ToHumanException on Object? {
  HumanException toHumanException(String humanMessage) {
    return HumanException.fromError(humanMessage: humanMessage, error: this ?? 'Unknown error');
  }
}
