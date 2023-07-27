import '../../tag_description.dart';
import '../documentation_types.dart';

TagArgument crossAxisAlignmentArgument({String name = 'crossAxisAlignment'}) => TagArgument(name, DocumentationTypes.crossAxisAlignmentValues);
TagArgument mainAxisAlignmentArgument({String name = 'mainAxisAlignment'}) => TagArgument(name, DocumentationTypes.mainAxisAlignmentValues);
TagArgument mainAxisSizeArgument({String name = 'mainAxisSize'}) => TagArgument(name, DocumentationTypes.mainAxisSizeValues);
TagArgument verticalDirectionArgument({String name = 'verticalDirection'}) => TagArgument(name, DocumentationTypes.verticalDirectionValues);
TagArgument textDirectionArgument({String name = 'textDirection'}) => TagArgument(name, DocumentationTypes.textDirectionValues);
TagArgument textBaselineArgument({String name = 'textBaseline'}) => TagArgument(name, DocumentationTypes.textBaselineValues);
