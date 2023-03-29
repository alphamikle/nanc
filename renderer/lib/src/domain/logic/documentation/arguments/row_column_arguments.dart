import 'package:rich_renderer/src/documentation/documentation_types.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagArgument crossAxisAlignmentArg([String name = 'crossAxisAlignment']) => TagArgument(name, DocumentationTypes.crossAxisAlignmentValues);
TagArgument mainAxisAlignmentArg([String name = 'mainAxisAlignment']) => TagArgument(name, DocumentationTypes.mainAxisAlignmentValues);
TagArgument mainAxisSizeArg([String name = 'mainAxisSize']) => TagArgument(name, DocumentationTypes.mainAxisSizeValues);
TagArgument verticalDirectionArg([String name = 'verticalDirection']) => TagArgument(name, DocumentationTypes.verticalDirectionValues);
TagArgument textDirectionArg([String name = 'textDirection']) => TagArgument(name, DocumentationTypes.textDirectionValues);
TagArgument textBaselineArg([String name = 'textBaseline']) => TagArgument(name, DocumentationTypes.textBaselineValues);
