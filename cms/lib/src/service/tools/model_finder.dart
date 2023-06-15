import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:model/model.dart';

import '../../domain/model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../errors/errors.dart';
import '../routing/params_list.dart';

Model findEntity(BuildContext context) {
  final GoRouter router = GoRouter.of(context);

  final String? entityId = router.routerDelegate.currentConfiguration.pathParameters[Params.modelId.name];
  if (entityId == null) {
    notFoundModelIdError();
  }
  final Model? entity = context.read<ModelListBloc>().tryToFindModelById(entityId);
  if (entity == null) {
    notFoundModelError(entityId);
  }
  return entity;
}
