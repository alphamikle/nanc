import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../document/logic/bloc/base_document_bloc/base_page_state.dart';
import '../../../field/logic/fields/id_field/id_field.dart';
import '../../../field/logic/fields/query_filter_field/query_filter_field.dart';
import '../../../model/logic/model/logic/model.dart';
import '../../../model/ui/component/fields_form.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_icon_button.dart';
import '../../../ui_kit/domain/ui/components/kit_column.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/confirm_modal.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_base_modal_bottom.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_modal.dart';
import '../../../ui_kit/domain/ui/components/kit_preloader_v2.dart';
import '../../../ui_kit/domain/ui/components/kit_text.dart';
import '../../../ui_kit/domain/ui/components/kit_tooltip.dart';
import '../../logic/logic/bloc/collection_bloc.dart';
import '../../logic/logic/bloc/collection_state.dart';

class CollectionFilterModal extends StatefulWidget {
  const CollectionFilterModal({
    super.key,
  });

  @override
  State<CollectionFilterModal> createState() => _CollectionFilterModalState();
}

class _CollectionFilterModalState extends State<CollectionFilterModal> {
  late final CollectionBloc collectionBloc = context.read();
  GlobalKey<FormState> formKey = GlobalKey();
  final Model filterModel = Model(
    name: 'Filter',
    icon: IconPackNames.mdi_filter,
    fields: [
      [
        IdField(isStub: true),
      ],
      [
        QueryFilterField(name: 'Query', id: QueryConditionField.conditionWrapperKey),
      ],
    ],
  );

  void apply() {
    unawaited(collectionBloc.applyFilters());
    context.navigator.pop();
  }

  void close() {
    unawaited(Future<void>.delayed(const Duration(seconds: 1)).then((value) => collectionBloc.restoreFiltersBackup()));
    context.navigator.pop();
  }

  Future<void> reset() async {
    final bool isConfirmed = await confirmAction(context: context, title: 'Are you sure you want to reset all the filters?');
    if (isConfirmed) {
      await collectionBloc.wipeQueryFilters();
      formKey = GlobalKey();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BaseDocumentBloc>.value(
      value: collectionBloc.filterStructureBloc,
      child: Builder(
        builder: (BuildContext context) {
          return BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
            builder: (BuildContext context, BaseDocumentState baseState) {
              return BlocBuilder<CollectionBloc, CollectionState>(
                builder: (BuildContext context, CollectionState state) {
                  return KitModal(
                    onClose: close,
                    header: const KitText(text: 'Collection filter'),
                    headerSuffix: Padding(
                      padding: const EdgeInsets.only(right: Gap.regular),
                      child: Material(
                        child: KitTooltip(
                          text: 'Reset',
                          child: KitIconButton(
                            color: context.theme.colorScheme.error,
                            iconColor: context.theme.colorScheme.onError,
                            icon: IconPack.mdi_notification_clear_all,
                            onPressed: reset,
                          ),
                        ),
                      ),
                    ),
                    child: KitColumn(
                      children: [
                        const KitPreloaderV2(isLoading: false),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(Gap.regular),
                            child: FieldsForm(
                              formKey: formKey,
                              model: filterModel,
                              creationMode: false,
                              withBottomPadding: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Gap.large),
                          child: Row(
                            children: [
                              const Spacer(),
                              KitBaseModalBottom(
                                onOk: apply,
                                onCancel: close,
                                okText: 'Apply',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
