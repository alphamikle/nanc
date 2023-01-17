import 'package:storybook/src/tools/usecase_factory.dart';

typedef GroupRegistrar = void Function(UseCaseFactory factory);

class ComponentsGroup {
  const ComponentsGroup({required this.groupName, required this.components});

  final GroupName groupName;
  final GroupRegistrar components;
}
