import 'package:rich_renderer/src/tag_description.dart';

TagArgument doubleArg(String name, [String description = '']) => TagArgument(name, {'double'}, description);
TagArgument stringArg(String name, [String description = '']) => TagArgument(name, {'String'}, description);
TagArgument intArg(String name, [String description = '']) => TagArgument(name, {'int'}, description);
TagArgument boolArg(String name) => TagArgument(name, {'bool'});
