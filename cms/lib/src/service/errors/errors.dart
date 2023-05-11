import '../../domain/page/logic/bloc/page_bloc/page_state.dart';

Never notFoundModelIdError([String? modelId]) => throw Exception('Not found modelId${modelId != null ? ' "$modelId"' : ''}');

Never notFoundModelError(ModelId modelId) => throw Exception('Not found model with id "$modelId"');
