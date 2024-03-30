import '../../tag_description.dart';
import '../documentation_types.dart';
import 'scalar_arguments.dart';

TagArgument alignmentArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.alignmentEnumValues);
TagArgument boxFitArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.boxFitValues);
TagArgument stackFitArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.stackFitValues);
TagArgument xArgument() => doubleArgument(name: 'x');
TagArgument yArgument() => doubleArgument(name: 'y');
TagArgument scaleXArgument() => doubleArgument(name: 'scaleX');
TagArgument scaleYArgument() => doubleArgument(name: 'scaleY');
