import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation_types.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagArgument alignmentArg([String name = 'align']) => TagArgument(name, DocumentationTypes.alignmentEnumValues);
TagArgument boxFitArg([String name = 'fit']) => TagArgument(name, DocumentationTypes.boxFitValues);
TagArgument stackFitArg([String name = 'fit']) => TagArgument(name, DocumentationTypes.stackFitValues);
TagArgument xArg() => doubleArg('x');
TagArgument yArg() => doubleArg('y');
TagArgument scaleXArg() => doubleArg('scaleX');
TagArgument scaleYArg() => doubleArg('scaleY');
