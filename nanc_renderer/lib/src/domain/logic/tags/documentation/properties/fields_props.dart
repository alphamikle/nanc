import '../../tag_description.dart';
import '../../tools/properties_names.dart';
import '../arguments/decoration_arguments.dart';
import '../arguments/fields_arguments.dart';
import '../arguments/row_column_arguments.dart';
import '../arguments/scalar_arguments.dart';
import 'border_radius.dart';
import 'padding.dart';
import 'text_style_props.dart';

TagProperty inputDecorationProp({required String name}) {
  return TagProperty(
    name: name,
    arguments: [
      colorArgument(name: 'fillColor'),
      boolArgument(name: 'alignLabelWithHint'),
      stringArgument(name: 'counterText'),
      boolArgument(name: 'enabled'),
      intArgument(name: 'errorMaxLines'),
      stringArgument(name: 'errorText'),
      boolArgument(name: 'filled'),
      colorArgument(name: 'focusColor'),
      intArgument(name: 'helperMaxLines'),
      stringArgument(name: 'helper'),
      intArgument(name: 'hintMaxLines'),
      stringArgument(name: 'hint'),
      textDirectionArgument(name: 'hintTextDirection'),
      colorArgument(name: 'hoverColor'),
      colorArgument(name: 'iconColor'),
      boolArgument(name: 'collapsed'),
      boolArgument(name: 'dense'),
      stringArgument(name: 'label'),
      colorArgument(name: 'prefixIconColor'),
      stringArgument(name: 'prefixText'),
      stringArgument(name: 'semanticCounterText'),
      colorArgument(name: 'suffixIconColor'),
      stringArgument(name: 'suffixText'),
    ],
    properties: [
      inputBorderProp(name: inputBorder),
      boxConstraintsProp(name: constraints),
      paddingProp(name: contentPadding),
      textStyleProp(name: counterStyle),
      inputBorderProp(name: disabledBorder),
      inputBorderProp(name: enabledBorder),
      inputBorderProp(name: errorBorder),
      textStyleProp(name: errorStyle),
      inputBorderProp(name: focusedBorder),
      inputBorderProp(name: focusedErrorBorder),
      textStyleProp(name: helperStyle),
      textStyleProp(name: hintStyle),
      textStyleProp(name: labelStyle),
      boxConstraintsProp(name: prefixIconConstraints),
      textStyleProp(name: prefixStyle),
      textStyleProp(name: suffixStyle),
      boxConstraintsProp(name: suffixIconConstraints),
    ],
    aliases: const [
      TagAlias(name: 'error'),
      TagAlias(name: 'icon'),
      TagAlias(name: 'counter'),
      TagAlias(name: 'label'),
      TagAlias(name: 'prefix'),
      TagAlias(name: 'prefixIcon'),
      TagAlias(name: 'suffix'),
      TagAlias(name: 'suffixIcon'),
    ],
  );
}

TagProperty inputBorderProp({required String name}) {
  return TagProperty(
    name: name,
    arguments: [
      inputBorderTypeArgument(name: 'type'),
      doubleArgument(name: 'gap'),
    ],
    properties: [
      borderRadiusProp(),
      borderSideProp(name: borderSide),
    ],
  );
}

TagProperty borderSideProp({required String name}) {
  return TagProperty(
    name: name,
    arguments: [
      colorArgument(name: 'color'),
      borderStyleArgument(name: 'style'),
      doubleArgument(name: 'width'),
      strokeAlignArgument(name: 'align'),
    ],
    properties: [],
  );
}

TagProperty boxConstraintsProp({required String name}) {
  return TagProperty(
    name: name,
    arguments: [
      doubleArgument(name: 'maxHeight'),
      doubleArgument(name: 'maxWidth'),
      doubleArgument(name: 'minWidth'),
      doubleArgument(name: 'minHeight'),
    ],
    properties: [],
  );
}
