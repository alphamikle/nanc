import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/scalar.dart';

TagArgument topLeftArg([String name = 'topLeft']) => doubleArg(name);
TagArgument topRightArg([String name = 'topRight']) => doubleArg(name);
TagArgument bottomRightArg([String name = 'bottomRight']) => doubleArg(name);
TagArgument bottomLeftArg([String name = 'bottomLeft']) => doubleArg(name);
TagArgument allArg([String name = 'all']) => doubleArg(name);
