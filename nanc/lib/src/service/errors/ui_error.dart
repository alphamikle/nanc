import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../domain/ui_kit/domain/logic/constants/gap.dart';
import '../../domain/ui_kit/domain/ui/components/kit_divider.dart';
import '../../domain/ui_kit/domain/ui/components/kit_text.dart';
import '../animations/knight.dart';
import 'human_exception.dart';

class UiError extends StatelessWidget {
  const UiError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: const Knight(),
            ),
          ),
          KitDivider.vertical(Gap.large),
          Expanded(
            flex: 2,
            child: StreamBuilder<HumanException>(
              stream: context.read<StreamController<HumanException>>().stream,
              builder: (BuildContext context, AsyncSnapshot<HumanException> snapshot) {
                String text = 'An error has occurred, we are striving to fix it!';
                if (snapshot.hasData) {
                  text = snapshot.requireData.humanMessage;
                }
                return KitText(
                  text: text,
                  style: context.theme.textTheme.titleMedium,
                );
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
