import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagArgument idArg() => stringArg('id');
TagArgument anyArg() => const TagArgument('anyArgument', {'dynamic'});
