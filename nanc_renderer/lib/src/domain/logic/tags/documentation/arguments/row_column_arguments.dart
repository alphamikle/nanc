import '../../tag_description.dart';
import '../documentation_types.dart';

TagArgument crossAxisAlignmentArgument({String name = 'crossAxisAlignment'}) => TagArgument(name: name, values: DocumentationTypes.crossAxisAlignmentValues);
TagArgument mainAxisAlignmentArgument({String name = 'mainAxisAlignment'}) => TagArgument(name: name, values: DocumentationTypes.mainAxisAlignmentValues);
TagArgument mainAxisSizeArgument({String name = 'mainAxisSize'}) => TagArgument(name: name, values: DocumentationTypes.mainAxisSizeValues);
TagArgument verticalDirectionArgument({String name = 'verticalDirection'}) => TagArgument(name: name, values: DocumentationTypes.verticalDirectionValues);
TagArgument textDirectionArgument({String name = 'textDirection'}) => TagArgument(name: name, values: DocumentationTypes.textDirectionValues);
TagArgument textBaselineArgument({String name = 'textBaseline'}) => TagArgument(name: name, values: DocumentationTypes.textBaselineValues);
