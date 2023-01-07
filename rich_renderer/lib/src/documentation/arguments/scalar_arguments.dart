import 'package:rich_renderer/src/tag_description.dart';

TagArgument doubleArg(String name) => TagArgument(name, {'double'});
TagArgument stringArg(String name, [String description = '']) => TagArgument(name, {'String'}, description);
TagArgument intArg(String name) => TagArgument(name, {'int'});
TagArgument boolArg(String name) => TagArgument(name, {'bool'});
