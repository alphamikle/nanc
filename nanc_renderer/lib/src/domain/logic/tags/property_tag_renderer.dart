import 'package:icons/icons.dart';
import 'package:tag_converter/tag_converter.dart';

import 'property_widget.dart';
import 'tag_description.dart';
import 'tag_renderer.dart';

class PropertyTagRenderer<T> extends TagRenderer<PropertyWidget<T>> {
  PropertyTagRenderer({
    required String tag,
    required super.builder,
  }) : super(tag: '$kPropertyPrefix$tag', description: const TagDescription.empty(), tagType: TagType.property, icon: IconPack.mdi_xml, example: '');
}
