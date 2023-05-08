import 'dart:async';

import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../model/ui/component/fields_form.dart';
import '../../../page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import '../../logic/logic/bloc/collection_filter_bloc.dart';

class CollectionFilterModal extends StatefulWidget {
  const CollectionFilterModal({
    super.key,
  });

  @override
  State<CollectionFilterModal> createState() => _CollectionFilterModalState();
}

class _CollectionFilterModalState extends State<CollectionFilterModal> {
  late final CollectionFilterBloc collectionFilterBloc = context.read();
  final GlobalKey<FormState> formKey = GlobalKey();
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
          return KitModal(
            onClose: close,
            header: const KitText(text: 'Collection filter'),
            child: KitColumn(
              children: [
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
      ),
    );
  }
}
