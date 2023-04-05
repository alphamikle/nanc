import '../../tag_description.dart';
import '../documentation_types.dart';

TagArgument clipArg([String name = 'clip']) => TagArgument(name, DocumentationTypes.clipValues);
TagArgument shapeArg([String name = 'shape']) => TagArgument(name, DocumentationTypes.boxShapeValues);
