import '../../tag_description.dart';
import 'scalar_arguments.dart';

TagArgument idArg() => stringArg('id');
TagArgument anyArg() => const TagArgument('anyArgument', {'dynamic'});
