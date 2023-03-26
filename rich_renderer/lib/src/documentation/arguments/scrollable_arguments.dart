import 'package:rich_renderer/rich_renderer.dart';

TagArgument axisArg([String name = 'axis']) => TagArgument(name, DocumentationTypes.axisValues);
TagArgument physicsArg([String name = 'physics']) => TagArgument(name, DocumentationTypes.scrollPhysicsEnumValues);
TagArgument cacheExtentArg([String name = 'cacheExtent']) => doubleArg(name);
TagArgument itemExtent([String name = 'itemExtent']) => doubleArg(name);
