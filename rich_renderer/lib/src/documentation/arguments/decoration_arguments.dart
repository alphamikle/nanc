import 'package:rich_renderer/src/documentation/documentation_types.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagArgument colorArg([String name = 'color']) => TagArgument(
      name,
      {
        '#D5FFFFFF',
        'DA9745',
      },
      '''
Color value should be a hex representation of the color in the next possible forms:
* #FFAADD - HEX value with the "#" prefix
* FFAADD - HEX value without "#" prefix
* #A5FFAADD - 8-byte HEX value with the opacity starting numbers "A5" and "#" prefix
* A5FFAADD - 8-byte HEX value with the opacity starting numbers "A5" and without "#" prefix
''',
    );

TagArgument blendModeArg(String name) => TagArgument(name, DocumentationTypes.blendModeValues);
TagArgument strokeAlignArg([String name = 'strokeAlign']) => TagArgument(name, DocumentationTypes.strokeAlignValues);
TagArgument blurStyleArg([String name = 'blurStyle']) => TagArgument(name, DocumentationTypes.blurStyleValues);
TagArgument tileModeArg([String name = 'tileMode']) => TagArgument(name, DocumentationTypes.tileModeValues);
TagArgument materialTypeArg([String name = 'type']) => TagArgument(name, DocumentationTypes.materialTypeValues);
