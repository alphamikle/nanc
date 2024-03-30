import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../property_tag_renderer.dart';
import '../../rich_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import 'input_decoration_arguments.dart';
import 'input_decoration_property_widget.dart';

PropertyTagRenderer<InputDecoration> inputDecorationProperty(String tag) {
  return PropertyTagRenderer(
    tag: tag,
    builder: (BuildContext context, WidgetTag element, RichRenderer renderer) {
      final InputDecorationArguments arguments = InputDecorationArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: renderer.renderChildren(context, element.children));

      final InputBorder? defaultBorder = extractor.getProperty(inputBorder);
      final bool simple = arguments.simpleBorders ?? false;

      final InputDecorationPropertyWidget result = InputDecorationPropertyWidget(
        name: tag,
        property: InputDecoration(
          error: extractor.getAlias('error'),
          icon: extractor.getAlias('icon'),
          counter: extractor.getAlias('counter'),
          label: extractor.getAlias('label'),
          prefix: extractor.getAlias('prefix'),
          prefixIcon: extractor.getAlias('prefixIcon'),
          suffix: extractor.getAlias('suffix'),
          suffixIcon: extractor.getAlias('suffixIcon'),
          border: defaultBorder,
          constraints: extractor.getProperty(constraints),
          contentPadding: extractor.getProperty(contentPadding),
          counterStyle: extractor.getProperty(counterStyle),
          disabledBorder: simple ? defaultBorder : extractor.getProperty(disabledBorder),
          enabledBorder: simple ? defaultBorder : extractor.getProperty(enabledBorder),
          errorBorder: simple ? defaultBorder : extractor.getProperty(errorBorder),
          errorStyle: extractor.getProperty(errorStyle),
          focusedBorder: simple ? defaultBorder : extractor.getProperty(focusedBorder),
          focusedErrorBorder: simple ? defaultBorder : extractor.getProperty(focusedErrorBorder),
          helperStyle: extractor.getProperty(helperStyle),
          hintStyle: extractor.getProperty(hintStyle),
          labelStyle: extractor.getProperty(labelStyle),
          prefixIconConstraints: extractor.getProperty(prefixIconConstraints),
          prefixStyle: extractor.getProperty(prefixStyle),
          suffixStyle: extractor.getProperty(suffixStyle),
          suffixIconConstraints: extractor.getProperty(suffixIconConstraints),
          alignLabelWithHint: arguments.alignLabelWithHint,
          fillColor: arguments.fillColor,
          counterText: arguments.counterText,
          // TODO(alphamikle): Use value from the text field too
          enabled: arguments.enabled ?? true,
          errorMaxLines: arguments.errorMaxLines,
          errorText: arguments.errorText,
          filled: arguments.filled,

          /// ? Don't needed
          // floatingLabelAlignment: arguments.floatingLabelAlignment,
          // floatingLabelBehavior: arguments.floatingLabelBehavior,
          // floatingLabelStyle: arguments.floatingLabelStyle,
          focusColor: arguments.focusColor,
          helperMaxLines: arguments.helperMaxLines,
          helperText: arguments.helper,
          hintMaxLines: arguments.hintMaxLines,
          hintText: arguments.hint,
          hintTextDirection: arguments.hintTextDirection,
          hoverColor: arguments.hoverColor,
          iconColor: arguments.iconColor,
          isCollapsed: arguments.collapsed ?? false,
          isDense: arguments.dense,
          labelText: arguments.label,
          prefixIconColor: arguments.prefixIconColor,
          prefixText: arguments.prefixText,
          semanticCounterText: arguments.semanticCounterText,
          suffixIconColor: arguments.suffixIconColor,
          suffixText: arguments.suffixText,
        ),
      );

      return result;
    },
  );
}
