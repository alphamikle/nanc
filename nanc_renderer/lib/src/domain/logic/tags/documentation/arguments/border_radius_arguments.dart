import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagArgument topLeftArg([String name = 'topLeft']) => doubleArg(name);
TagArgument topRightArg([String name = 'topRight']) => doubleArg(name);
TagArgument bottomRightArg([String name = 'bottomRight']) => doubleArg(name);
TagArgument bottomLeftArg([String name = 'bottomLeft']) => doubleArg(name);
TagArgument allArg([String name = 'all']) => doubleArg(name);
