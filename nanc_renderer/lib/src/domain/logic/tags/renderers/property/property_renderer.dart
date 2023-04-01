import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_list.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/alignment/alignment_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/alignment/alignment_property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/border/border_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/border/border_property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/border_radius/border_radius_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/border_radius/border_radius_property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/button_style/button_style_factory.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/color/color_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/color/color_property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/decoration/decoration_factory.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/double/double_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/double/double_property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/gradient/gradient_factory.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/padding/padding_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/padding/padding_property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/shadow/shadow_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/shadow/shadow_property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/properties/text_style/text_style_factory.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property_tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property_widget.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/types/types.dart';
import 'package:tools/tools.dart';

List<Property> properties() => [
      Property(alignment),
      Property(begin),
      Property(end),
      Property(padding),
      Property(margin),
      Property(minimum),
      Property.withChildren(decoration),
      Property(borderRadius),
      Property(border),
      Property(shadow),
      Property(color),
      Property(stop),
      Property.withChildren(gradient),
      Property(textStyle),
      Property(buttonStyle),
      // TODO(alphamikle): Add new properties here
    ];

List<TagRendererFactory> propertiesRenderers() {
  final List<TagRendererFactory> factories = [];
  for (final Property property in properties()) {
    factories.add(propertyToRenderer(property));
  }
  return factories;
}

TagRendererFactory propertyToRenderer(Property property) {
  final String name = property.name;
  final bool haveChildren = property.haveChildren;
  return () {
    return PropertyTagRenderer(
      icon: IconPack.mdi_code_braces_box,
      tag: 'prop:$name',
      pattern: RegExp('<prop:$name( .*)?${haveChildren ? '' : '/'}>'),
      endPattern: haveChildren ? RegExp('</prop:$name>') : null,
      example: '',
      builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
        final Json arguments = element.attributes;
        final ThemeData theme = context.theme;

        final Map<String, PropertyWidgetFactory> factories = {
          alignment: () => AlignmentPropertyWidget(name: alignment, property: AlignmentArguments.fromJson(arguments).toAlignment()),
          begin: () => AlignmentPropertyWidget(name: begin, property: AlignmentArguments.fromJson(arguments).toAlignment()),
          end: () => AlignmentPropertyWidget(name: end, property: AlignmentArguments.fromJson(arguments).toAlignment()),
          padding: () => PaddingPropertyWidget(name: padding, property: PaddingArguments.fromJson(arguments).toPadding()),
          margin: () => PaddingPropertyWidget(name: margin, property: PaddingArguments.fromJson(arguments).toPadding()),
          minimum: () => PaddingPropertyWidget(name: minimum, property: PaddingArguments.fromJson(arguments).toPadding()),
          borderRadius: () => BorderRadiusPropertyWidget(name: borderRadius, property: BorderRadiusArguments.fromJson(arguments).toBorderRadius()),
          border: () => BorderPropertyWidget(name: border, property: BorderArguments.fromJson(arguments).toBorder(context)),
          shadow: () => ShadowPropertyWidget(name: shadow, property: ShadowArguments.fromJson(arguments).toBoxShadow(context)),
          color: () => ColorPropertyWidget(name: color, property: ColorArguments.fromJson(arguments).color ?? theme.colorScheme.primary),
          stop: () => DoublePropertyWidget(name: stop, property: DoubleArguments.fromJson(arguments).value ?? 0),
          gradient: () => gradientFactory(context: context, name: gradient, element: element, richRenderer: richRenderer),
          decoration: () => decorationFactory(context: context, name: decoration, element: element, richRenderer: richRenderer),
          textStyle: () => textStyleFactory(context: context, name: textStyle, element: element, richRenderer: richRenderer),
          buttonStyle: () => buttonStyleFactory(context: context, name: buttonStyle, element: element, richRenderer: richRenderer),
          // TODO(alphamikle): Add new properties here
        };

        return factories[name]?.call() ?? const PropertyWidget(name: '', property: null);
      },
    );
  };
}
