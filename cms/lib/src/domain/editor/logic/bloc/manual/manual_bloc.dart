import 'package:fields/fields.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

import '../../../../general/logic/model/menu_element.dart';
import '../editor/editor_bloc.dart';
import 'manual_state.dart';

final RegExp _prettyCodeRegExp = RegExp(r'> \s{1,3}');

class ManualBloc extends EditorBloc {
  ManualBloc({
    required super.eventBus,
  }) : super(initialState: ManualState.empty()) {
    controller.addListener(controllerListener);
    emit(state);
  }

  @override
  ManualState get state {
    if (super.state is ManualState) {
      return super.state as ManualState;
    }
    throw Exception('"${super.state.runtimeType}" is not a ManualState');
  }

  void selectTag(MenuElement tagElement, TagRenderer tagRenderer) {
    emit(state.copyWith(
      activeElement: tagElement,
      activeTagRenderer: tagRenderer,
    ));
    final String example = tagRenderer.example.replaceAll(_prettyCodeRegExp, '>\n').trim();
    initFromModel(
      ScreenContentModel(
        content: example,
        contentType: ScreenContentType.scrollable,
      ),
    );
  }

  @override
  void controllerListener() {
    emit(
      state.copyWith(
        markdownContent: controller.text,
      ),
    );
  }
}
