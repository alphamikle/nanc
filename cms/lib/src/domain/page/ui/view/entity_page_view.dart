import 'dart:async';

import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../../cms.dart';
import '../../../../service/config/config.dart';
import '../../../../service/routing/endpoints.dart';
import '../../../../service/tools/model_finder.dart';
import '../../../model/ui/component/fields_form.dart';

class EntityPageView extends StatefulWidget {
  const EntityPageView({
    required this.creationMode,
    required this.soloEntity,
    super.key,
  });

  final bool creationMode;
  final bool soloEntity;

  @override
  State<EntityPageView> createState() => _EntityPageViewState();
}

class _EntityPageViewState extends State<EntityPageView> {
  GlobalKey<FormState> formKey = GlobalKey();

  PageBloc get pageBloc {
    final BasePageBloc bloc = context.read();
    if (bloc is PageBloc) {
      return bloc;
    }
    throw Exception('Not found $PageBloc in the widget tree');
  }

  bool get creationMode => widget.creationMode;

  bool get soloEntity => widget.soloEntity;

  Future<void> validateAndSave(Model entity) async {
    if (formKey.currentState?.validate() ?? false) {
      if (creationMode) {
        await pageBloc.create(entity);
        if (mounted) {
          final Model model = findModel(context);
          if (soloEntity) {
            context.go(Endpoints.solo.page.segment(modelId: model.id));
          } else {
            context.goNamed(
              Endpoints.collection.model.page.name,
              pathParameters: {
                Params.modelId.name: model.id,
                Params.pageId.name: context.read<BasePageBloc>().valueForKey(model.idField.id).toString(),
              },
            );
          }
        }
      } else {
        await pageBloc.save(entity);
        if (mounted) {
          context.go(context.location.uri.toString());
        }
      }
    }
  }

  Future<void> confirmAndDelete(Model model) async {
    final String? modelId = context.location.pathParameters[Params.modelId.name];
    final bool confirmed = await confirmAction(context: context, title: 'Do you really want to delete this page?');
    if (confirmed) {
      await pageBloc.delete(model);
      if (model.isCollection) {
        context.navigator.pop();
      } else {
        if (modelId != null) {
          context.goNamed(Endpoints.solo.page.name, pathParameters: {Params.modelId.name: modelId});
        } else {
          context.goNamed(Endpoints.solo.name);
        }
      }
      formKey.currentState?.reset();
    }
  }

  Future<void> confirmAndReset(Model model) async {
    final bool confirmed = await confirmAction(context: context, title: 'Do you want to reset all not saved changes of this page?');
    if (mounted && confirmed) {
      final String currentRoute = context.location.uri.toString();
      await pageBloc.reset(model);
      if (mounted) {
        context.go(currentRoute);
        formKey = GlobalKey();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? modelId = context.location.pathParameters[Params.modelId.name];
    if (modelId == null) {
      return const KitNotFoundModelId();
    }

    return BlocBuilder<ModelListBloc, ModelListState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (BuildContext context, ModelListState listState) {
        if (listState.isLoading) {
          return const KitCenteredText(text: 'Loading');
        }

        final Model? model = context.read<ModelListBloc>().tryToFindModelById(modelId);
        if (model == null) {
          return KitNotFoundModelById(modelId: modelId);
        }

        return KitViewSubContainer(
          child: KitColumn(
            children: [
              BlocBuilder<BasePageBloc, BaseEntityPageState>(
                builder: (BuildContext context, BaseEntityPageState state) {
                  return KitViewHeader(
                    children: [
                      if (soloEntity == false)
                        Padding(
                          padding: const EdgeInsets.only(right: kPaddingLarge),
                          child: KitIconButton(
                            icon: IconPack.flu_chevron_left_filled,
                            onPressed: () => context.navigator.pop(),
                          ),
                        ),
                      const Spacer(),
                      if (creationMode == false)
                        Padding(
                          padding: const EdgeInsets.only(right: Gap.regular),
                          child: KitButton(
                            onPressed: () async => confirmAndDelete(model),
                            color: context.theme.colorScheme.error,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: state.isDeleting
                                  ? SizedBox(width: 35, child: KitPreloader(color: context.theme.colorScheme.error))
                                  : const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(IconPack.mdi_delete_empty),
                                        KitDivider(width: Gap.regular),
                                        KitText(text: 'Delete'),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: Gap.regular),
                        child: KitButton(
                          onPressed: () async => showJsonPreviewModal(
                            context: context,
                            title: 'Page data',
                            structure: filterJsonFromStructures(pageBloc.state.data),
                          ),
                          color: context.kitColors.successColor,
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(IconPack.mdi_code_json),
                              KitDivider(width: Gap.regular),
                              KitText(text: 'Structure'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: Gap.regular),
                        child: KitButton(
                          onPressed: state.isChanged ? () async => confirmAndReset(model) : null,
                          color: context.theme.colorScheme.error,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: state.isDeleting
                                ? SizedBox(width: 35, child: KitPreloader(color: context.theme.colorScheme.error))
                                : const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(IconPack.mdi_notification_clear_all),
                                      KitDivider(width: Gap.regular),
                                      KitText(text: 'Reset'),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      KitButton(
                        onPressed: state.isChanged ? () async => validateAndSave(model) : null,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: state.isSaving
                              ? const SizedBox(width: 35, child: KitPreloader())
                              : const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(IconPack.flu_save_filled),
                                    KitDivider(width: Gap.regular),
                                    KitText(text: 'Save'),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              BlocBuilder<BasePageBloc, BaseEntityPageState>(
                builder: (BuildContext context, BaseEntityPageState state) {
                  return KitPreloaderV2(isLoading: state.isLoading);
                },
              ),
              Expanded(
                child: BlocBuilder<BasePageBloc, BaseEntityPageState>(
                  builder: (BuildContext context, BaseEntityPageState state) {
                    if (state.isLoading) {
                      return const KitCenteredText(text: 'Loading');
                    } else if (state.isError) {
                      return const UiError();
                    }

                    return FieldsForm(
                      formKey: formKey,
                      model: model,
                      creationMode: creationMode,
                      withBottomPadding: true,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
