import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/renderers/property/properties/alignment/alignment_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/alignment/alignment_property_widget.dart';
import 'package:rich_renderer/src/renderers/property/properties/border/border_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/border/border_property_widget.dart';
import 'package:rich_renderer/src/renderers/property/properties/border_radius/border_radius_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/border_radius/border_radius_property_widget.dart';
import 'package:rich_renderer/src/renderers/property/properties/color/color_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/color/color_property_widget.dart';
import 'package:rich_renderer/src/renderers/property/properties/decoration/decoration_factory.dart';
import 'package:rich_renderer/src/renderers/property/properties/double/double_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/double/double_property_widget.dart';
import 'package:rich_renderer/src/renderers/property/properties/gradient/gradient_factory.dart';
import 'package:rich_renderer/src/renderers/property/properties/padding/padding_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/padding/padding_property_widget.dart';
import 'package:rich_renderer/src/renderers/property/properties/shadow/shadow_arguments.dart';
import 'package:rich_renderer/src/renderers/property/properties/shadow/shadow_property_widget.dart';
import 'package:rich_renderer/src/renderers/property/properties/text_style/text_style_factory.dart';
import 'package:rich_renderer/src/renderers/property/property.dart';
import 'package:rich_renderer/src/renderers/property/property_tag_renderer.dart';
import 'package:rich_renderer/src/renderers/property/property_widget.dart';
import 'package:tools/tools.dart';

List<Property> properties() => [
      Property(alignment),
      Property(padding),
      Property(minimum),
      Property.withChildren(decoration),
      Property(borderRadius),
      Property(border),
      Property(shadow),
      Property(color),
      Property(stop),
      Property.withChildren(gradient),
      Property(textStyle),
      // TODO(alphamikle): Add new properties here
    ];

Future<List<TagRendererFactory>> propertiesRenderers() async {
  final List<TagRendererFactory> factories = [];
  for (final Property property in properties()) {
    factories.add(await propertyToRenderer(property));
  }
  return factories;
}

Future<TagRendererFactory> propertyToRenderer(Property property) async {
  final String name = property.name;
  final bool haveChildren = property.haveChildren;

  return () {
    return PropertyTagRenderer(
      icon: IconPack.mdi_code_braces_box,
      tag: 'prop:$name',
      pattern: RegExp('<prop:$name ?.*${haveChildren ? '' : '/'}>'),
      endPattern: haveChildren ? RegExp('</prop:$name') : null,
      example: '',
      builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
        final Json arguments = element.attributes;
        final ThemeData theme = Theme.of(context);

        final Map<String, PropertyWidgetFactory> factories = {
          alignment: () => AlignmentPropertyWidget(name: alignment, property: AlignmentArguments.fromJson(arguments).toAlignment()),
          padding: () => PaddingPropertyWidget(name: padding, property: PaddingArguments.fromJson(arguments).toPadding()),
          minimum: () => PaddingPropertyWidget(name: minimum, property: PaddingArguments.fromJson(arguments).toPadding()),
          borderRadius: () => BorderRadiusPropertyWidget(name: borderRadius, property: BorderRadiusArguments.fromJson(arguments).toBorderRadius()),
          border: () => BorderPropertyWidget(name: border, property: BorderArguments.fromJson(arguments).toBorder(context)),
          shadow: () => ShadowPropertyWidget(name: shadow, property: ShadowArguments.fromJson(arguments).toBoxShadow(context)),
          color: () => ColorPropertyWidget(name: color, property: ColorArguments.fromJson(arguments).color ?? theme.colorScheme.primary),
          stop: () => DoublePropertyWidget(name: stop, property: DoubleArguments.fromJson(arguments).value ?? 0),
          gradient: () => gradientFactory(context: context, name: gradient, element: element, richRenderer: richRenderer),
          decoration: () => decorationFactory(context: context, name: decoration, element: element, richRenderer: richRenderer),
          textStyle: () => textStyleFactory(context: context, name: textStyle, element: element, richRenderer: richRenderer),
          // TODO(alphamikle): Add new properties here
        };

        return factories[name]?.call() ?? const PropertyWidget(name: '', property: null);
      },
    );
  };
}
