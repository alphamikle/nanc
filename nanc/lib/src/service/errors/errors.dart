import 'package:nanc_tools/nanc_tools.dart';

import 'human_exception.dart';

Never notFoundModelIdError([String? modelId]) => throw HumanException(
      humanMessage: 'Not found modelId${modelId != null ? ' "$modelId"' : ''}',
      originalMessage: null,
      stackTrace: null,
    );

Never notFoundModelError(ModelId modelId) => throw HumanException(
      humanMessage: 'Not found model with id "$modelId"',
      originalMessage: null,
      stackTrace: null,
    );
