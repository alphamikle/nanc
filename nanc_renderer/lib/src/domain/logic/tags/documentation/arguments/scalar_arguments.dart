import '../../tag_description.dart';

TagArgument doubleArgument({required String name, String description = ''}) => TagArgument(name: name, values: {'double'}, description: description);
TagArgument stringArgument({required String name, String description = ''}) => TagArgument(name: name, values: {'String'}, description: description);
TagArgument intArgument({required String name, String description = ''}) => TagArgument(name: name, values: {'int'}, description: description);
TagArgument boolArgument({required String name, String description = ''}) => TagArgument(name: name, values: {'bool'}, description: description);
