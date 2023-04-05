import '../../tag_description.dart';
import '../documentation_types.dart';
import 'scalar_arguments.dart';

TagArgument alignmentArg([String name = 'align']) => TagArgument(name, DocumentationTypes.alignmentEnumValues);
TagArgument boxFitArg([String name = 'fit']) => TagArgument(name, DocumentationTypes.boxFitValues);
TagArgument stackFitArg([String name = 'fit']) => TagArgument(name, DocumentationTypes.stackFitValues);
TagArgument xArg() => doubleArg('x');
TagArgument yArg() => doubleArg('y');
TagArgument scaleXArg() => doubleArg('scaleX');
TagArgument scaleYArg() => doubleArg('scaleY');
