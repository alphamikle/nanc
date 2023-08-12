import 'properties/alignment/alignment_property.dart';
import 'properties/border/border_property.dart';
import 'properties/border_radius/border_radius_property.dart';
import 'properties/button_style/button_style_property.dart';
import 'properties/color/color_property.dart';
import 'properties/decoration/decoration_property.dart';
import 'properties/double/double_property.dart';
import 'properties/gradient/gradient_property.dart';
import 'properties/icon_theme/icon_theme_property.dart';
import 'properties/padding/padding_property.dart';
import 'properties/shadow/shadow_property.dart';
import 'properties/strut_style/strut_style_property.dart';
import 'properties/system_overlay_style/system_overlay_property.dart';
import 'properties/text_height_behavior/text_height_behavior_property.dart';
import 'properties/text_style/text_style_property.dart';
import 'renderers/alias/alias_renderer.dart';
import 'renderers/align/align_renderer.dart';
import 'renderers/aspect_ratio/aspect_ratio_renderer.dart';
import 'renderers/center/center_renderer.dart';
import 'renderers/clipr_rect/clipr_rect_renderer.dart';
import 'renderers/column/column_renderer.dart';
import 'renderers/component/component_renderer.dart';
import 'renderers/container/container_renderer.dart';
import 'renderers/custom_scroll_view/custom_scroll_view_renderer.dart';
import 'renderers/data/data_renderer.dart';
import 'renderers/default_text_style/default_text_style_renderer.dart';
import 'renderers/divider/divider_renderer.dart';
import 'renderers/expanded/expanded_renderer.dart';
import 'renderers/fade_in/fade_in_renderer.dart';
import 'renderers/flexible_space_bar/flexible_space_bar_renderer.dart';
import 'renderers/for/for_renderer.dart';
import 'renderers/fractional_translation/fractional_translation_renderer.dart';
import 'renderers/icon/icon_renderer.dart';
import 'renderers/if/show_renderer.dart';
import 'renderers/image/image_renderer.dart';
import 'renderers/ink_well/ink_well_renderer.dart';
import 'renderers/list_view/list_view_renderer.dart';
import 'renderers/material/material_renderer.dart';
import 'renderers/padding/padding_renderer.dart';
import 'renderers/physical_model/physical_model_renderer.dart';
import 'renderers/placeholder/placeholder_renderer.dart';
import 'renderers/positioned/positioned_renderer.dart';
import 'renderers/preferred_size/preferred_size_renderer.dart';
import 'renderers/rich_text/rich_text_renderer.dart';
import 'renderers/rich_text/text_span/text_span_renderer.dart';
import 'renderers/rich_text/widget_span/widget_span_renderer.dart';
import 'renderers/rotated_box/rotated_box_renderer.dart';
import 'renderers/row/row_renderer.dart';
import 'renderers/safe_area/safe_area_renderer.dart';
import 'renderers/scale/scale_renderer.dart';
import 'renderers/sized_box/sized_box_renderer.dart';
import 'renderers/sliver_app_bar/sliver_app_bar_renderer.dart';
import 'renderers/sliver_grid/sliver_grid_renderer.dart';
import 'renderers/sliver_list/sliver_list_renderer.dart';
import 'renderers/sliver_padding/sliver_padding_renderer.dart';
import 'renderers/sliver_persistent_header/sliver_persistent_header_renderer.dart';
import 'renderers/sliver_to_box_adapter/sliver_to_box_adapter_renderer.dart';
import 'renderers/stack/stack_renderer.dart';
import 'renderers/template/template_renderer.dart';
import 'renderers/text/text_renderer.dart';
import 'renderers/text_button/text_button_renderer.dart';
import 'renderers/tooltip/tooltip_renderer.dart';
import 'renderers/visibility_notifier/visibility_notifier_renderer.dart';
import 'tag_renderer.dart';
import 'tools/properties_names.dart';

abstract class TagsCollection {
  static List<TagRenderer> renderers = [
    /// ? PROPERTIES
    buttonStyleProperty(buttonStyle),
    alignmentProperty(alignment),
    alignmentProperty(begin),
    alignmentProperty(end),
    borderProperty(border),
    borderProperty(shape),
    paddingProperty(padding),
    paddingProperty(margin),
    paddingProperty(minimum),
    borderRadiusProperty(borderRadius),
    colorProperty(color),
    decorationProperty(decoration),
    doubleProperty(stop),
    gradientProperty(gradient),
    shadowProperty(shadow),
    textStyleProperty(textStyle),
    textStyleProperty(titleTextStyle),
    textStyleProperty(toolbarTextStyle),
    systemOverlayProperty(systemOverlayStyle),
    iconThemeProperty(iconTheme),
    iconThemeProperty(actionsIconTheme),
    strutStyleProperty(strutStyle),
    textHeightBehaviorProperty(textHeightBehavior),

    /// ? WIDGETS
    aliasRenderer(),
    paddingRenderer(),
    rowRenderer(),
    placeholderRenderer(),
    containerRenderer(),
    columnRenderer(),
    inkWellRenderer(),
    textRenderer(),
    expandedRenderer(),
    centerRenderer(),
    iconRenderer(),
    dividerRenderer(),
    imageRenderer(),
    clipRRectRenderer(),
    stackRenderer(),
    positionedRenderer(),
    dataRenderer(),
    forRenderer(),
    templateRenderer(),
    componentRenderer(),
    materialRenderer(),
    sizedBoxRenderer(),
    safeAreaRenderer(),
    alignRenderer(),
    fractionalTranslationRenderer(),
    scaleRenderer(),
    physicalModelRenderer(),
    showRenderer(),
    fadeInRenderer(),
    tooltipRenderer(),
    aspectRatioRenderer(),
    textButtonRenderer(),
    listViewRenderer(),
    visibilityNotifierRenderer(),
    sliverPersistentHeaderRenderer(),
    sliverListRenderer(),
    sliverGridRenderer(),
    sliverToBoxAdapterRenderer(),
    customScrollViewRenderer(),
    sliverPaddingRenderer(),
    sliverAppBarRenderer(),
    preferredSizeRenderer(),
    flexibleSpaceBarRenderer(),
    rotatedBoxRenderer(),
    richTextRenderer(),
    textSpanRenderer(),
    widgetSpanRenderer(),
    defaultTextStyleRenderer(),
  ];
}
