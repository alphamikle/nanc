import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../../../../service/routing/endpoints.dart';
import '../../../../service/routing/params_list.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_button.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_icon_button.dart';
import '../../../ui_kit/domain/ui/components/kit_divider.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_search_input.dart';
import '../../../ui_kit/domain/ui/components/kit_text.dart';
import '../../../ui_kit/domain/ui/components/kit_tooltip.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_header.dart';
import '../../../ui_kit/domain/ui/theme/kit_colors.dart';
import '../../logic/logic/bloc/collection_bloc.dart';
import 'collection_filter_modal.dart';

class CollectionViewHeader extends StatelessWidget {
  const CollectionViewHeader({
    required this.modelId,
    required this.query,
    super.key,
  });

  final String modelId;
  final QueryField? query;

  @override
  Widget build(BuildContext context) {
    return KitViewHeader(
      children: [
        KitButton(
          onPressed: () => context.goNamed(
            Endpoints.createCollectionPage.name,
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
                    builder: (BuildContext context) => BlocProvider<CollectionBloc>.value(
                      value: context.read<CollectionBloc>(),
                      child: const CollectionFilterModal(),
                    ),
                  ),
                  icon: query != null ? IconPack.mdi_filter_check : IconPack.mdi_filter_cog,
                  iconColor: context.theme.colorScheme.onSurfaceVariant,
                  color: query != null ? context.kitColors.successColor.o25 : context.theme.colorScheme.surfaceVariant,
                  rounder: 10,
                  iconSize: 24,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 250,
          child: KitSearchInput(
            controller: context.read<CollectionBloc>().globalSearchController,
          ),
        ),
      ],
    );
  }
}
