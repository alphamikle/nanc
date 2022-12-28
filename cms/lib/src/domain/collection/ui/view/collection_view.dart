import 'package:cms/src/domain/collection/logic/logic/bloc/collection_bloc.dart';
import 'package:cms/src/domain/collection/logic/logic/bloc/collection_state.dart';
import 'package:cms/src/domain/model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import 'package:cms/src/service/routing/params_list.dart';
import 'package:cms/src/service/routing/route_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({
    super.key,
  });

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  final ScrollController horizontalScrollController = ScrollController();

  void openRow(Model model, Json rowData) => context.vRouter.to(Routes.pageOfCollectionModel(model.id, rowData[model.idField.id].toString()));

  @override
  Widget build(BuildContext context) {
    final String? modelId = context.vRouter.pathParameters[Params.modelId.name];
    if (modelId == null) {
      return const KitNotFoundModelId();
    }
    final Model? model = context.read<ModelListBloc>().findModelById(modelId);
    if (model == null) {
      return KitNotFoundModelById(modelId: modelId);
    }

    return KitViewSubContainer(
      child: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (BuildContext context, CollectionState state) {
          if (state.isLoading) {
            return const KitPreloader();
          } else if (state.dataRows.isEmpty) {
            return Center(
              child: KitBigButton(
                text: 'Create first page',
                onPressed: () => context.vRouter.to(Routes.createModelPage(modelId)),
              ),
            );
          }

          return KitColumn(
            children: [
              KitViewHeader(
                children: [
                  KitButton(
                    text: 'Create',
                    onPressed: () => context.vRouter.to(Routes.createModelPage(modelId)),
                  ),
                ],
              ),
              Expanded(
                child: Material(
                  type: MaterialType.transparency,
                  child: KitTableV2(
                    model: model,
                    dataRows: state.dataRows,
                    horizontalScrollController: horizontalScrollController,
                    onRowPressed: (Json rowData) => openRow(model, rowData),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
