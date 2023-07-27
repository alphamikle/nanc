import '../../tag_description.dart';
import '../documentation_types.dart';
import 'scalar_arguments.dart';

TagArgument maxLinesArgument({String name = 'maxLines'}) => intArgument(name: name);

TagArgument textAlignArgument({String name = 'align'}) => TagArgument(name, DocumentationTypes.textAlignValues);

TagArgument textOverflowArgument({String name = 'overflow'}) => TagArgument(name, DocumentationTypes.textOverflowValues);

TagArgument fontSizeArgument({String name = 'size'}) => doubleArgument(name: name);

TagArgument fontWeightArgument({String name = 'weight'}) => TagArgument(name, DocumentationTypes.fontWeightEnumValues);

TagArgument textDecorationArgument({String name = 'decoration'}) => TagArgument(name, DocumentationTypes.textDecorationEnumValues);

TagArgument fontArgument({String name = 'font'}) {
  return stringArgument(name: name, description: '''
> ## Custom fonts
>
> Nanc supports all (or almost all) fonts available in [Google Fonts](https://fonts.google.com/). In order to use any of the fonts - just specify its name as it is listed on the Google Fonts website. After that, it will connect automatically. If you see that nothing has changed, most likely you used the wrong font name, or, very unlikely, the font is not yet supported.
>
> For a full list of available fonts you can check the official [google_fonts](https://pub.dev/packages/google_fonts) package.
''');
}
