import '../../tag_description.dart';
import 'scalar_arguments.dart';

TagArgument idArgument() => stringArgument(name: 'id');
TagArgument anyArgument() => const TagArgument(name: 'anyArgument', values: {'dynamic'});
TagArgument keyArgument() => const TagArgument(
      name: 'key',
      values: {'String', 'int', 'double', 'dynamic'},
      description: 'Any value entered will be used as the `ValueKey` argument, which will be used as the `key` of your widget/tag.',
    );
