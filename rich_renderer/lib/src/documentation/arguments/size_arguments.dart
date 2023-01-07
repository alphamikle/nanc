import 'package:rich_renderer/src/documentation/arguments/scalar_arguments.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagArgument widthArg([String name = 'width']) => doubleArg(name);
TagArgument heightArg([String name = 'height']) => doubleArg(name);
TagArgument sizeArg([String name = 'size']) => doubleArg(name);
TagArgument strokeWidthArg([String name = 'strokeWidth']) => doubleArg(name);
TagArgument flexArg([String name = 'flex']) => intArg(name);
