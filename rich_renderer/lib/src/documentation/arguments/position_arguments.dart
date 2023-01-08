import 'package:rich_renderer/src/documentation/documentation_types.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagArgument alignmentArg([String name = 'align']) => TagArgument(name, DocumentationTypes.alignmentEnumValues);
TagArgument boxFitArg([String name = 'fit']) => TagArgument(name, DocumentationTypes.boxFitValues);
TagArgument stackFitArg([String name = 'fit']) => TagArgument(name, DocumentationTypes.stackFitValues);
