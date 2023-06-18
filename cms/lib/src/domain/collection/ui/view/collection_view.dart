import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../service/errors/errors.dart';
import '../../../../service/errors/ui_error.dart';
import '../../../../service/routing/endpoints.dart';
import '../../../../service/routing/params_list.dart';
import '../../../../service/routing/route_list.dart';
import '../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../logic/logic/bloc/collection_bloc.dart';
import '../../logic/logic/bloc/collection_filter_bloc.dart';
import '../../logic/logic/bloc/collection_state.dart';
import '../component/collection_filter_modal.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({
    super.key,
  });

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  late final Model model = _findModel();
  late final Map<int, double>? initialSizes = read<SettingsBloc>().widthForModel(model.id);

  void openRow(Model model, Json rowData) => context.go(
        Routes.pageOfCollectionModel(
          Uri.encodeComponent(model.id),
          Uri.encodeComponent(
            rowData[model.idField.id].toString(),
          ),
        ),
      );

  Model _findModel() {
    final String? modelId = context.location.pathParameters[Params.modelId.name];
    if (modelId == null) {
      notFoundModelIdError(modelId);
    }
    final Model? model = context.read<ModelListBloc>().tryToFindModelById(modelId);
    if (model == null) {
      notFoundModelError(modelId);
    }
    return model;
  }

  @override
  Widget build(BuildContext context) {
    final String? modelId = context.location.pathParameters[Params.modelId.name];
    if (modelId == null) {
      return const KitNotFoundModelId();
    }
    final Model? model = context.read<ModelListBloc>().tryToFindModelById(modelId);
    if (model == null) {
      return KitNotFoundModelById(modelId: modelId);
    }

    return KitViewSubContainer(
      child: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (BuildContext context, CollectionState state) {
          return KitColumn(
            children: [
              KitViewHeader(
                children: [
                  KitButton(
                    onPressed: () => context.goNamed(
                      Endpoints.collection.model.pageCreation.name,
                      pathParameters: {
                        Params.modelId.name: modelId,
                      },
                    ),
                    child: const Row(
                      children: [
                        Icon(IconPack.flu_form_new_filled),
                        KitDivider(width: Gap.regular),
                        KitText(text: 'Create'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: Gap.regular),
                    child: KitTooltip(
                      text: 'Advanced search',
                      child: SizedBox(
                        height: 44,
                        width: 44,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: KitIconButton(
                            onPressed: () async => showModal(
                              context: context,
                              configuration: const FadeScaleTransitionConfiguration(barrierDismissible: false),
                              builder: (BuildContext context) => BlocProvider<CollectionFilterBloc>.value(
                                value: context.read<CollectionFilterBloc>(),
                                child: const CollectionFilterModal(),
                              ),
                            ),
                            icon: state.query != null ? IconPack.mdi_filter_check : IconPack.mdi_filter_cog,
                            iconColor: context.theme.colorScheme.onSurfaceVariant,
                            color: state.query != null ? context.kitColors.successColor.o25 : context.theme.colorScheme.surfaceVariant,
                            rounder: 10,
                            iconSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: KitSearchInput(controller: read<CollectionBloc>().globalSearchController),
                  ),
                ],
              ),
              KitPreloaderV2(isLoading: state.isLoading),
              Expanded(
                child: Builder(
                  builder: (BuildContext context) {
                    if (state.isLoading || model.id != state.modelId) {
                      return const KitCenteredText(text: 'Loading');
                    } else if (state.notFoundAnything) {
                      return const KitCenteredText(text: 'Not found');
                    } else if (state.isError) {
                      return const UiError();
                    }
                    return Material(
                      type: MaterialType.transparency,
                      child: KitTableV2(
                        model: model,
                        selectedSort: state.sort,
                        dataRows: state.dataRows,
                        currentPage: state.currentPage,
                        totalPages: state.totalPages,
                        onPagination: read<CollectionBloc>().paginate,
                        onRowPressed: (Json rowData) => openRow(model, rowData),
                        onSort: read<CollectionBloc>().sort,
                        onResize: (Map<int, double> widths) => read<SettingsBloc>().saveWidth(modelId: modelId, widths: widths),
                        initialSizes: initialSizes,
                        perPage: NetworkConfig.paginationLimitParameterDefaultValue,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
