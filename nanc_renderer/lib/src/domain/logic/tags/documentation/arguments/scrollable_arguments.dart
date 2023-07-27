import '../../tag_description.dart';
import '../documentation.dart';

TagArgument axisArgument({required String name}) => TagArgument(name, DocumentationTypes.axisValues);
TagArgument physicsArgument({required String name}) => TagArgument(name, DocumentationTypes.scrollPhysicsEnumValues);
TagArgument cacheExtentArgument({required String name}) => doubleArgument(name: name);
TagArgument itemExtentArgument({required String name}) => doubleArgument(name: name);
