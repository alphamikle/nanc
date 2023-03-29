import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/scalar_arguments.dart';
import 'package:rich_renderer/src/documentation/documentation_types.dart';

TagArgument maxLinesArg({
  String name = 'maxLines',
}) {
  return intArg(name);
}

TagArgument textAlignArg({
  String name = 'align',
}) {
  return TagArgument(
    name,
    DocumentationTypes.textAlignValues,
  );
}

TagArgument textOverflowArg({
  String name = 'overflow',
}) {
  return TagArgument(
    name,
    DocumentationTypes.textOverflowValues,
  );
}

TagArgument fontSizeArg({
  String name = 'size',
}) {
  return doubleArg(name);
}

TagArgument fontWeightArg({
  String name = 'weight',
}) {
  return TagArgument(name, DocumentationTypes.fontWeightEnumValues);
}

TagArgument textDecorationArg({
  String name = 'decoration',
}) {
  return TagArgument(name, DocumentationTypes.textDecorationEnumValues);
}

TagArgument fontArg({
  String name = 'font',
}) {
  return stringArg(name, '''
> ## Custom fonts
>
> Nanc supports all (or almost all) fonts available in [Google Fonts](https://fonts.google.com/). In order to use any of the fonts - just specify its name as it is listed on the Google Fonts website. After that, it will connect automatically. If you see that nothing has changed, most likely you used the wrong font name, or, very unlikely, the font is not yet supported.
>
> For a full list of available fonts you can check the official [google_fonts](https://pub.dev/packages/google_fonts) package.
''');
}
