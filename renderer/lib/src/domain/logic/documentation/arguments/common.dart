import 'package:rich_renderer/src/documentation/arguments/scalar_arguments.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagArgument idArg() => stringArg('id');
TagArgument anyArg() => const TagArgument('anyArgument', {'dynamic'});
