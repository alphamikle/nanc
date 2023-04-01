import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation_types.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagArgument clipArg([String name = 'clip']) => TagArgument(name, DocumentationTypes.clipValues);
TagArgument shapeArg([String name = 'shape']) => TagArgument(name, DocumentationTypes.boxShapeValues);
