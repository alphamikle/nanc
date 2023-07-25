import '../../tag_description.dart';
import '../documentation_types.dart';
import 'scalar_arguments.dart';

TagArgument colorArg([String name = 'color']) => TagArgument(
      name,
      {
        '#D5FFFFFF',
        'DA9745',
        'red',
        'armadillo',
      },
      '''
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

TagArgument blendModeArg(String name) => TagArgument(name, DocumentationTypes.blendModeValues);
// TagArgument strokeAlignArg([String name = 'strokeAlign']) => TagArgument(name, DocumentationTypes.strokeAlignValues);
TagArgument blurStyleArg([String name = 'blurStyle']) => TagArgument(name, DocumentationTypes.blurStyleValues);
TagArgument tileModeArg([String name = 'tileMode']) => TagArgument(name, DocumentationTypes.tileModeValues);
TagArgument materialTypeArg([String name = 'type']) => TagArgument(name, DocumentationTypes.materialTypeValues);
TagArgument elevationArg([String name = 'elevation']) => doubleArg(name);
