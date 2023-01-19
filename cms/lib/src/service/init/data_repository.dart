import 'package:additions/additions.dart';
import 'package:rich_renderer/rich_renderer.dart';

class DataRepository {
  const DataRepository({
    required this.clickHandlers,
    required this.renderers,
  });

  final List<RichClickHandler> clickHandlers;
  final List<TagRendererFactory> renderers;
}
