typedef Extractor = dynamic Function(dynamic object);

class HumanException implements Exception {
  const HumanException({
    required this.humanMessage,
    required this.originalMessage,
    required this.stackTrace,
    this.errorsStack = const [],
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
      message = listError._extract((object) => object.message) ?? listError.toString();
      if (listStackTrace is StackTrace) {
        stackTrace = listStackTrace;
      }
    } else {
      message = error.toString();
      stackTrace = error._extract((object) => object.stack) ?? error._extract((object) => object.stackTrace);
    }
    message = message.replaceFirst('Exception: ', '');

    final List<HumanException> errorsStack = [];
    if (error is HumanException) {
      errorsStack.add(error);
    }

    return HumanException(
      humanMessage: humanMessage,
      originalMessage: message,
      stackTrace: stackTrace,
      errorsStack: errorsStack,
    );
  }

  final String humanMessage;
  final String? originalMessage;
  final StackTrace? stackTrace;
  final List<HumanException> errorsStack;

  String fullInfo([int? number]) {
    if (errorsStack.isNotEmpty) {
      number = 1;
    }

    return '''
# ${number == null ? '' : '$number. '}Error details
${hasOriginalMessage ? '\n## Original error:' : ''}
${hasOriginalMessage ? originalMessage.toString() : ''}
${hasStackTrace ? '\n## Stack trace:' : ''}
${hasStackTrace ? stackTrace.toString() : ''}
''';
  }

  String get additionalInfo => '${hasOriginalMessage ? '$originalMessage' : ''}${hasStackTrace ? '${hasOriginalMessage ? '\n\n' : ''}$stackTrace' : ''}';
  String get errorsStackInfo {
    if (errorsStack.isEmpty) {
      return '';
    }
    final List<String> errorsAdditionalInfo = [];
    final Set<HumanException> children = _collectEmbeddedErrors({});
    int number = 2;
    for (final HumanException child in children) {
      errorsAdditionalInfo.add(child.fullInfo(number));
      number++;
    }
    return errorsAdditionalInfo.join('\n');
  }

  bool get hasOriginalMessage => originalMessage != null && originalMessage!.trim().isNotEmpty;
  bool get hasStackTrace => stackTrace != null;

  Set<HumanException> _collectEmbeddedErrors(Set<HumanException> collector) {
    for (final HumanException exception in errorsStack) {
      collector.add(exception);
      collector.addAll(exception._collectEmbeddedErrors({}));
    }
    return collector;
  }

  @override
  String toString() => humanMessage;
}

extension ToHumanException on Object? {
  HumanException toHumanException(String humanMessage) {
    return HumanException.fromError(humanMessage: humanMessage, error: this ?? 'Unknown error');
  }

  T? _extract<T>(Extractor extractor) {
    try {
      return extractor(this as dynamic) as T?;
    } catch (error) {
      return null;
    }
  }
}
