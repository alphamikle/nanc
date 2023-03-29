import 'package:rich_renderer/src/documentation/arguments/scalar_arguments.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagArgument leftArg([String name = 'left']) => doubleArg(name);
TagArgument topArg([String name = 'top']) => doubleArg(name);
TagArgument rightArg([String name = 'right']) => doubleArg(name);
TagArgument bottomArg([String name = 'bottom']) => doubleArg(name);
TagArgument allPaddingArg([String name = 'all']) => doubleArg(name);
