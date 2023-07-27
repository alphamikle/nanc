import '../../tag_description.dart';
import 'scalar_arguments.dart';

TagArgument idArgument() => stringArgument(name: 'id');
TagArgument anyArgument() => const TagArgument('anyArgument', {'dynamic'});
