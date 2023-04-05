import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components_group.dart';

typedef CategoryName = String;
typedef GroupName = String;
typedef ComponentName = String;

typedef BuilderDiscriminator = void Function({required WidgetBuilder builder, required ComponentName component, GroupName? group});
typedef WidgetDiscriminator = void Function({required Widget widget, required ComponentName component, GroupName? group});

class UseCaseFactory {
  UseCaseFactory({
    required CategoryName category,
    List<ComponentsGroup> components = const [],
  }) : _category = category {
    if (components.isNotEmpty) {
      for (final ComponentsGroup group in components) {
        _registerGroup(group);
      }
    }
  }

  final CategoryName _category;
  final Map<GroupName, WidgetbookComponent> _groups = {};
  final Set<ComponentName> _components = {};

  GroupName? _groupName;
  bool get isEmpty => _components.isEmpty;
  bool get isNotEmpty => _components.isNotEmpty;

  void describeBuilder({required WidgetBuilder builder, required ComponentName component, GroupName? group}) {
    if (_components.contains(component)) {
      throw Exception('Component with name "$component" already specified!');
    }
    _components.add(component);
    final GroupName effectiveGroupName = group ?? _groupName ?? 'Group ($component)';
    if (!_groups.containsKey(effectiveGroupName)) {
      _groups[effectiveGroupName] = WidgetbookComponent(name: effectiveGroupName, useCases: []);
    }
    _groups[effectiveGroupName]!.useCases.add(
          WidgetbookUseCase(
            name: component,
            builder: builder,
          ),
        );
  }

  void describeWidget({required Widget widget, required ComponentName component, GroupName? group}) {
    describeBuilder(builder: (BuildContext context) => widget, component: component, group: group);
  }

  void _registerGroup(ComponentsGroup group) {
    _groupName = group.groupName;
    group.components(this);
    _groupName = null;
  }

  WidgetbookCategory toCategory() {
    final List<WidgetbookComponent> groups = [..._groups.values];
    for (final WidgetbookComponent group in groups) {
      if (group.useCases.isNotEmpty) {
        group.useCases.sort((a, b) => a.name.compareTo(b.name));
      }
    }
    groups.sort((a, b) => a.name.compareTo(b.name));

    return WidgetbookCategory(
      name: _category,
      widgets: groups,
    );
  }
}
