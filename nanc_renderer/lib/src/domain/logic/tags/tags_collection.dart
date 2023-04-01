import 'package:nanc_renderer/src/domain/logic/tags/renderers/align/align_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/aspect_ratio/aspect_ratio_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/center/center_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/clipr_rect/clipr_rect_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/column/column_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/component/component_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/container/container_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/data/data_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/divider/divider_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/expanded/expanded_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/fade_in/fade_in_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/for/for_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/fractional_translation/fractional_translation_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/icon/icon_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/if/show_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/image/image_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/ink_well/ink_well_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/list_view/list_view_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/material/material_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/padding/padding_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/physical_model/physical_model_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/placeholder/placeholder_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/positioned/positioned_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/property_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/row/row_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/safe_area/safe_area_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/scale/scale_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/sized_box/sized_box_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/stack/stack_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/template/template_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/text/text_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/text_button/text_button_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/tooltip/tooltip_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/types/types.dart';

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
  ];
}
