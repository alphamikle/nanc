import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagArgument axisArg([String name = 'axis']) => TagArgument(name, DocumentationTypes.axisValues);
TagArgument physicsArg([String name = 'physics']) => TagArgument(name, DocumentationTypes.scrollPhysicsEnumValues);
TagArgument cacheExtentArg([String name = 'cacheExtent']) => doubleArg(name);
TagArgument itemExtent([String name = 'itemExtent']) => doubleArg(name);
