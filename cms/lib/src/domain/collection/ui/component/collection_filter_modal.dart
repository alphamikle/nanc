import 'dart:async';

import 'package:config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../model/ui/component/fields_form.dart';
import '../../../page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import '../../../page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import '../../logic/logic/bloc/collection_filter_bloc.dart';
import '../../logic/logic/bloc/collection_filter_state.dart';

class CollectionFilterModal extends StatefulWidget {
  const CollectionFilterModal({
    super.key,
  });

  @override
  State<CollectionFilterModal> createState() => _CollectionFilterModalState();
}

class _CollectionFilterModalState extends State<CollectionFilterModal> {
  late final CollectionFilterBloc collectionFilterBloc = context.read();
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
    collectionFilterBloc.apply();
    context.navigator.pop();
  }

  void close() {
    unawaited(Future<void>.delayed(const Duration(seconds: 1)).then((value) => collectionFilterBloc.restoreBackup()));
    context.navigator.pop();
  }

  Future<void> reset() async {
    final bool isConfirmed = await confirmAction(context: context, title: 'Are you sure you want to reset all the filters?');
    if (isConfirmed) {
      collectionFilterBloc.reset();
      formKey = GlobalKey();
    }
  }

  @override
  void initState() {
    super.initState();
    collectionFilterBloc.backup();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BasePageBloc>.value(
      value: collectionFilterBloc.filterStructureBloc,
      child: Builder(
        builder: (BuildContext context) {
          return BlocBuilder<BasePageBloc, BaseEntityPageState>(
            builder: (BuildContext context, BaseEntityPageState baseState) {
              return BlocBuilder<CollectionFilterBloc, CollectionFilterState>(
                builder: (BuildContext context, CollectionFilterState state) {
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
                          child: FieldsForm(
                            formKey: formKey,
                            model: filterModel,
                            creationMode: false,
                            withBottomPadding: true,
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
