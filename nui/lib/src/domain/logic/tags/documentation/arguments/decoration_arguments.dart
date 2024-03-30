import '../../tag_description.dart';
import '../documentation_types.dart';
import 'scalar_arguments.dart';

TagArgument colorArgument({required String name}) => TagArgument(
      name: name,
      values: {
        '#D5FFFFFF',
        'DA9745',
        'red',
        'armadillo',
      },
      description: '''
Color value can be a hex or human-readable representation of the color in the next possible forms:
* #FFAADD - HEX value with the "#" prefix
* FFAADD - HEX value without "#" prefix
* #A5FFAADD - 8-byte HEX value with the opacity starting numbers "A5" and "#" prefix
* A5FFAADD - 8-byte HEX value with the opacity starting numbers "A5" and without "#" prefix
* red
* blue
* etc.

Full list of human-readable color names can be found [here](https://github.com/alphamikle/nanc/blob/master/tools/lib/src/tools/named_colors.dart).
''',
    );

TagArgument blendModeArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.blendModeValues);
TagArgument blurStyleArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.blurStyleValues);
TagArgument tileModeArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.tileModeValues);
TagArgument materialTypeArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.materialTypeValues);
TagArgument elevationArgument([String name = 'elevation']) => doubleArgument(name: name);
TagArgument packageArgument({String name = 'package'}) {
  return TagArgument(name: name, values: {'String'}, description: '''
The name of the package from which the image is included.
  ''');
}

TagArgument brightnessArgument({required String name}) => TagArgument(name: name, values: DocumentationTypes.brightnessValues);
