import '../../tag_description.dart';
import '../documentation_types.dart';
import 'scalar_arguments.dart';

TagArgument maxLinesArgument({String name = 'maxLines'}) => intArgument(name: name);

TagArgument textAlignArgument({String name = 'align'}) => TagArgument(name: name, values: DocumentationTypes.textAlignValues);

TagArgument textOverflowArgument({String name = 'overflow'}) => TagArgument(name: name, values: DocumentationTypes.textOverflowValues);

TagArgument fontSizeArgument({String name = 'size'}) => doubleArgument(name: name);

TagArgument fontWeightArgument({String name = 'weight'}) => TagArgument(name: name, values: DocumentationTypes.fontWeightEnumValues);

TagArgument textDecorationArgument({String name = 'decoration'}) => TagArgument(name: name, values: DocumentationTypes.textDecorationEnumValues);

TagArgument fontArgument({String name = 'font'}) {
  return stringArgument(name: name, description: '''
> ## Custom fonts
>
> Nanc supports all (or almost all) fonts available in [Google Fonts](https://fonts.google.com/). In order to use any of the fonts - just specify its name as it is listed on the Google Fonts website. After that, it will connect automatically. If you see that nothing has changed, most likely you used the wrong font name, or, very unlikely, the font is not yet supported.
>
> For a full list of available fonts you can check the official [google_fonts](https://pub.dev/packages/google_fonts) package.
''');
}

TagArgument textWidthBasisArgument({String name = 'widthBasis'}) => TagArgument(name: name, values: DocumentationTypes.textWidthBasisValues);

TagArgument fontStyleArgument({String name = 'fontStyle'}) => TagArgument(name: name, values: DocumentationTypes.fontStyleValues);

TagArgument textLeadingDistribution({String name = 'leadingDistribution'}) => TagArgument(name: name, values: DocumentationTypes.leadingDistributionValues);

TagArgument separatorArgument({String name = 'separator'}) => stringArgument(name: name, description: r'''
A string that will be used to merge text content located within the tag itself.

For example, if you have the following UI code:

```html
<text>
  Hello Dear Friend,
  How was your day?
  Do you have something new?
</text>
```

You can either combine strings into a single line using a space as the value, `separator=""`, or into multiple lines using the line break character `separator="\n"` as the value.
However, `\n` is used by default, so you don't have to change anything.
''');

TagArgument skipEmptyLinesArgument({String name = 'skipEmptyLines'}) => boolArgument(
      name: name,
      description: 'Determines whether blank lines should be discarded, in the content inside the tag.',
    );

TagArgument placeholderAlignmentArgument({String name = 'alignment'}) => TagArgument(name: name, values: DocumentationTypes.placeholderAlignmentValues);
