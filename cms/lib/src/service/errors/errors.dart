import 'package:cms/src/domain/page/logic/bloc/page_bloc/page_state.dart';

Never notFoundEntityIdError() => throw Exception('Not found entityId');

Never notFoundModelError(EntityId entityId) => throw Exception('Not found model with id "$entityId"');
