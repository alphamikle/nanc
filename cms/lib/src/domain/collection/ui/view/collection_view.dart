import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../service/errors/ui_error.dart';
import '../../../../service/routing/endpoints.dart';
import '../../../../service/routing/params_list.dart';
import '../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../logic/logic/bloc/collection_bloc.dart';
import '../../logic/logic/bloc/collection_state.dart';
import '../component/collection_view_header.dart';

class CollectionView extends StatefulWidget {
  const CollectionView({
    super.key,
  });

  @override
  State<CollectionView> createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  CollectionBloc? collectionBloc;

  void openRow(Model model, Json rowData) => context.goNamed(
        Endpoints.collection.model.page.name,
        pathParameters: {
          Params.modelId.name: Uri.encodeComponent(model.id),
          Params.pageId.name: Uri.encodeComponent(rowData[model.idField.id].toString()),
        },
      );

  @override
  void dispose() {
    collectionBloc?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    collectionBloc ??= context.read<CollectionBloc>();

    return KitViewSubContainer(
      child: BlocBuilder<CollectionBloc, CollectionState>(
        builder: (BuildContext context, CollectionState state) {
          final String modelId = state.modelId;
          final Model? model = context.read<ModelListBloc>().tryToFindModelById(modelId);
          if (model == null) {
            return KitNotFoundModelById(modelId: modelId);
          }
          final Map<int, double>? initialSizes = read<SettingsBloc>().widthForModel(model.id);

          return KitColumn(
            children: [
              CollectionViewHeader(modelId: modelId, query: state.query),
              KitPreloaderV2(isLoading: state.isLoading),
              Expanded(
                child: Builder(
                  builder: (BuildContext context) {
                    if (state.isLoading || model.id != state.modelId) {
                      return const KitPreloaderV3.center();
                    } else if (state.notFoundAnything) {
                      return const KitCenteredText(text: 'Not found');
                    } else if (state.isError) {
                      return const UiError();
                    }
                    if (state.isLoading == false && state.dataRows.isNotEmpty) {
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
                    }
                    return const KitPreloaderV3.center();
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
