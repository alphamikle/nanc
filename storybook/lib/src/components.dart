import 'package:storybook/src/components/custom.dart';
import 'package:storybook/src/tools/usecase_factory.dart';

UseCaseFactory components() => UseCaseFactory(
      category: 'Components',
      components: [
        custom(),
      ],
    );
