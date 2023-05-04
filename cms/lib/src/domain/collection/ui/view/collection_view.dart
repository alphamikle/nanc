import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

import '../../../../service/routing/params_list.dart';
import '../../../../service/routing/route_list.dart';
import '../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../logic/logic/bloc/collection_bloc.dart';
import '../../logic/logic/bloc/collection_state.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({
    super.key,
  });

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  void openRow(Model model, Json rowData) => context.vRouter.to(
        Routes.pageOfCollectionModel(
          Uri.encodeComponent(model.id),
          Uri.encodeComponent(
            rowData[model.idField.id].toString(),
          ),
        ),
      );

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
          final bool loadingWithNoData = state.isLoading && state.dataRows.isEmpty && state.notFoundAnything == false;

          return KitColumn(
            children: [
              KitViewHeader(
                children: [
                  KitButton(
                    onPressed: () => context.vRouter.to(Routes.createModelPage(modelId)),
                    child: Row(
                      children: const [
                        Icon(IconPack.flu_form_new_filled),
                        KitDivider(width: Gap.regular),
                        KitText(text: 'Create'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 250,
                    child: KitTextField(
                      controller: read<CollectionBloc>().globalSearchController,
                      decoration: searchInputDecoration(
                        context: context,
                        placeholder: 'Search',
                      ),
                      prefixIcon: IconPack.flu_search_filled,
                    ),
                  ),
                ],
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 500),
                crossFadeState: state.isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstChild: const LinearProgressIndicator(minHeight: 3, value: 0),
                secondChild: const LinearProgressIndicator(minHeight: 3),
              ),
              Expanded(
                child: KitShowIf(
                  c1: state.notFoundAnything,
                  w1: const KitCenteredText(text: 'Not found'),
                  c2: loadingWithNoData,
                  w2: const KitCenteredText(text: 'Loading'),
                  fallback: Material(
                    type: MaterialType.transparency,
                    child: KitTableV2(
                      model: model,
                      dataRows: state.dataRows,
                      currentPage: state.currentPage,
                      totalPages: state.totalPages,
                      onPagination: read<CollectionBloc>().paginate,
                      onRowPressed: (Json rowData) => openRow(model, rowData),
                    ),
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
