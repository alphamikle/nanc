import 'renderers/align/align_renderer.dart';
import 'renderers/aspect_ratio/aspect_ratio_renderer.dart';
import 'renderers/center/center_renderer.dart';
import 'renderers/clipr_rect/clipr_rect_renderer.dart';
import 'renderers/column/column_renderer.dart';
import 'renderers/component/component_renderer.dart';
import 'renderers/container/container_renderer.dart';
import 'renderers/data/data_renderer.dart';
import 'renderers/divider/divider_renderer.dart';
import 'renderers/expanded/expanded_renderer.dart';
import 'renderers/fade_in/fade_in_renderer.dart';
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
import 'renderers/property/property_renderer.dart';
import 'renderers/row/row_renderer.dart';
import 'renderers/safe_area/safe_area_renderer.dart';
import 'renderers/scale/scale_renderer.dart';
import 'renderers/sized_box/sized_box_renderer.dart';
import 'renderers/stack/stack_renderer.dart';
import 'renderers/template/template_renderer.dart';
import 'renderers/text/text_renderer.dart';
import 'renderers/text_button/text_button_renderer.dart';
import 'renderers/tooltip/tooltip_renderer.dart';
import 'renderers/visibility_notifier/visibility_notifier_renderer.dart';
import 'tag_renderer.dart';
import 'types/types.dart';

abstract class TagsCollection {
  static List<TagRenderer> renderers = [
    ...propertiesRenderers().map((TagRendererFactory factory) => factory()),
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
    // codeRenderer(),
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
  ];
}
