import '../../tag_description.dart';
import 'scalar_arguments.dart';

TagArgument widthArg([String name = 'width']) => doubleArg(name);
TagArgument heightArg([String name = 'height']) => doubleArg(name);
TagArgument sizeArg([String name = 'size']) => doubleArg(name);
TagArgument strokeWidthArg([String name = 'strokeWidth']) => doubleArg(name);
TagArgument flexArg([String name = 'flex']) => intArg(name);
TagArgument dxArg([String name = 'dx']) => doubleArg(name);
TagArgument dyArg([String name = 'dy']) => doubleArg(name);
