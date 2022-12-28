import 'package:cms/src/domain/model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import 'package:cms/src/service/errors/errors.dart';
import 'package:cms/src/service/routing/params_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:vrouter/vrouter.dart';

Model findEntity(BuildContext context) {
  final String? entityId = context.vRouter.pathParameters[Params.modelId.name];
  if (entityId == null) {
    notFoundEntityIdError();
  }
  final Model? entity = context.read<ModelListBloc>().findModelById(entityId);
  if (entity == null) {
    notFoundModelError(entityId);
  }
  return entity;
}
