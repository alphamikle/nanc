import '../../../../../../nui.dart';
import '../../tools/properties_names.dart';

TagProperty iconStyleProp({required String name}) {
  return TagProperty(
    name: name,
    arguments: [
      colorArgument(name: 'color'),
      sizeArgument(),
      doubleArgument(name: 'fill'),
      doubleArgument(name: 'grade'),
      doubleArgument(name: 'opacity'),
      doubleArgument(name: 'opticalSize'),
      doubleArgument(name: 'weight'),
    ],
    properties: [
      shadowProp(name: shadow),
    ],
  );
}
