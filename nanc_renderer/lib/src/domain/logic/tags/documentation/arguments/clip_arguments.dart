import '../../tag_description.dart';
import '../documentation_types.dart';

TagArgument clipArgument({required String name}) => TagArgument(name, DocumentationTypes.clipValues);
TagArgument shapeArgument({required String name}) => TagArgument(name, DocumentationTypes.boxShapeValues);
