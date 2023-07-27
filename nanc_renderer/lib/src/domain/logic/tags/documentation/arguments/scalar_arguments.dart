import '../../tag_description.dart';

TagArgument doubleArgument({required String name, String description = ''}) => TagArgument(name, {'double'}, description);
TagArgument stringArgument({required String name, String description = ''}) => TagArgument(name, {'String'}, description);
TagArgument intArgument({required String name, String description = ''}) => TagArgument(name, {'int'}, description);
TagArgument boolArgument({required String name}) => TagArgument(name, {'bool'});
