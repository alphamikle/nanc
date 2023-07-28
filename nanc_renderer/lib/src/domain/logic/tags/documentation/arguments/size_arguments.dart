import '../../tag_description.dart';
import 'scalar_arguments.dart';

TagArgument widthArgument() => doubleArgument(name: 'width');
TagArgument heightArgument() => doubleArgument(name: 'height');
TagArgument sizeArgument() => doubleArgument(
      name: 'size',
      description: 'Instead of specifying the same value in the `width` and `height` parameters, you can specify it once in the `size` parameter.',
    );
TagArgument strokeWidthArgument() => doubleArgument(name: 'strokeWidth');
TagArgument flexArgument() => intArgument(name: 'flex');
TagArgument dxArgument() => doubleArgument(name: 'dx');
TagArgument dyArgument() => doubleArgument(name: 'dy');
