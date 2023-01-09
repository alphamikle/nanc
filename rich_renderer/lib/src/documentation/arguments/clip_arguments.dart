import 'package:rich_renderer/src/documentation/documentation_types.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagArgument clipArg([String name = 'clip']) => TagArgument(name, DocumentationTypes.clipValues);
TagArgument shapeArg([String name = 'shape']) => TagArgument(name, DocumentationTypes.boxShapeValues);
