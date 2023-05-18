import '../../domain/page/logic/bloc/page_bloc/page_state.dart';
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
