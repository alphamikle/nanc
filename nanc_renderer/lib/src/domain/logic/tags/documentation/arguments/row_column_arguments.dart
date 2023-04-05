import '../../tag_description.dart';
import '../documentation_types.dart';

TagArgument crossAxisAlignmentArg([String name = 'crossAxisAlignment']) => TagArgument(name, DocumentationTypes.crossAxisAlignmentValues);
TagArgument mainAxisAlignmentArg([String name = 'mainAxisAlignment']) => TagArgument(name, DocumentationTypes.mainAxisAlignmentValues);
TagArgument mainAxisSizeArg([String name = 'mainAxisSize']) => TagArgument(name, DocumentationTypes.mainAxisSizeValues);
TagArgument verticalDirectionArg([String name = 'verticalDirection']) => TagArgument(name, DocumentationTypes.verticalDirectionValues);
TagArgument textDirectionArg([String name = 'textDirection']) => TagArgument(name, DocumentationTypes.textDirectionValues);
TagArgument textBaselineArg([String name = 'textBaseline']) => TagArgument(name, DocumentationTypes.textBaselineValues);
