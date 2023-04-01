import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagArgument widthArg([String name = 'width']) => doubleArg(name);
TagArgument heightArg([String name = 'height']) => doubleArg(name);
TagArgument sizeArg([String name = 'size']) => doubleArg(name);
TagArgument strokeWidthArg([String name = 'strokeWidth']) => doubleArg(name);
TagArgument flexArg([String name = 'flex']) => intArg(name);
TagArgument dxArg([String name = 'dx']) => doubleArg(name);
TagArgument dyArg([String name = 'dy']) => doubleArg(name);
