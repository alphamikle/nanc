import '../../domain/page/logic/bloc/page_bloc/page_state.dart';

Never notFoundEntityIdError() => throw Exception('Not found entityId');

Never notFoundModelError(ModelId entityId) => throw Exception('Not found model with id "$entityId"');
