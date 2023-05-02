import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:tools/tools.dart';

import '../../theme/kit_borders.dart';
import '../kit_circle_preloader.dart';
import '../kit_list_tile.dart';
import '../kit_preloader.dart';
import '../kit_text.dart';
import 'kit_text_field.dart';

class KitAutocompleteTextField<T extends Object> extends StatefulWidget {
  const KitAutocompleteTextField({
    required this.finder,
    required this.controller,
    this.onSelect,
    this.placeholder,
    this.label,
    this.helper,
    this.itemBuilder,
    this.notFoundBuilder,
    this.formatters = const [],
    this.readOnly = false,
    this.size = kDefaultKitFieldSize,
    this.maxHeight,
    this.isChanged = false,
    this.withCursor = true,
    this.focusNode,
    this.closeOnSelect = true,
    this.noUpdateOnType = false,
    this.isRequired = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffix,
    this.prefix,
    this.validator,
    this.inputDecoration,
    this.suggestionOffset = -18,
    super.key,
  });

  final SuggestionsCallback<T> finder;
  final TextEditingController controller;
  final SuggestionSelectionCallback<T>? onSelect;
  final String? placeholder;
  final String? label;
  final String? helper;
  final ItemBuilder<T>? itemBuilder;
  final WidgetBuilder? notFoundBuilder;
  final List<TextInputFormatter> formatters;
  final bool readOnly;
  final double size;
  final double? maxHeight;
  final bool isChanged;
  final bool withCursor;
  final FocusNode? focusNode;
  final bool closeOnSelect;
  final bool noUpdateOnType;
  final bool isRequired;
  final FormFieldValidator<String?>? validator;
  final double suggestionOffset;

  final InputDecoration? inputDecoration;

  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Widget? suffix;
  final Widget? prefix;

  @override
  State<KitAutocompleteTextField> createState() => _KitAutocompleteTextFieldState<T>();
}

class _KitAutocompleteTextFieldState<T extends Object> extends State<KitAutocompleteTextField<T>> {
  final StreamController<bool> loadingStreamController = StreamController.broadcast();
  Stream<bool> get loadingStream => loadingStreamController.stream;
  late final FocusNode focusNode = widget.focusNode ?? FocusNode();

  Future<List<T>> localFinder(String query) async {
    loadingStreamController.add(true);
    try {
      final FutureOr<Iterable<T>> maybeFuture = widget.finder(query);
      final Iterable<T> result = maybeFuture is Future ? await maybeFuture : maybeFuture;
      loadingStreamController.add(false);
      return result.toList(growable: false);
    } catch (error) {
      loadingStreamController.add(false);
      rethrow;
    }
  }

  Widget itemBuilderDefault(BuildContext context, T itemData) {
    return KitListTile(
      title: itemData.toString(),
    );
  }

  Widget transitionBuilder(BuildContext context, Widget suggestions, AnimationController? controller) {
    final CurvedAnimation animation = CurvedAnimation(
      parent: controller!,
      curve: Curves.easeInOut,
    );
    final Widget fadeTransition = FadeTransition(
      opacity: animation,
      child: suggestions,
    );
    if (focusNode.hasFocus) {
      return fadeTransition;
    }
    return SizeTransition(
      axisAlignment: -1,
      sizeFactor: animation,
      child: fadeTransition,
    );
  }

  Widget loadingBuilder(BuildContext context) {
    return const ListTile(title: KitPreloader());
  }

  Widget notFoundBuilderDefault(BuildContext context) {
    return const ListTile(title: KitText(text: 'Not found...'));
  }

  Widget fieldPreloader({
    Widget? child,
  }) {
    return StreamBuilder(
      initialData: false,
      stream: loadingStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return KitCirclePreloader(isLoading: snapshot.data ?? false, child: child);
      },
    );
  }

  Widget buildSuffix() {
    if (widget.suffix != null) {
      return fieldPreloader(child: widget.suffix);
    }
    if (widget.suffixIcon != null) {
      return fieldPreloader(child: Icon(widget.suffixIcon));
    }
    return fieldPreloader();
  }

  Widget? buildPrefix() {
    if (widget.prefix != null) {
      return widget.prefix;
    }
    if (widget.prefixIcon != null) {
      return Icon(widget.prefixIcon);
    }
    return null;
  }

  void _voidSelector(dynamic _) {}

  @override
  void dispose() {
    unawaited(loadingStreamController.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = context.kitBorders.inputRadius;

    return TypeAheadFormField<T>(
      suggestionsCallback: localFinder,
      itemBuilder: widget.itemBuilder ?? itemBuilderDefault,
      onSuggestionSelected: widget.onSelect ?? _voidSelector,
      textFieldConfiguration: TextFieldConfiguration(
        controller: widget.controller,
        decoration: (widget.inputDecoration ??
                KitTextField.createInputDecoration(
                  context: context,
                  isChanged: widget.isChanged,
                  placeholder: widget.placeholder,
                  maxHeight: widget.maxHeight,
                  label: widget.label,
                  helper: widget.helper,
                ))
            .copyWith(
          suffix: buildSuffix(),
          prefix: buildPrefix(),
        ),
        focusNode: focusNode,
        inputFormatters: widget.formatters,
        style: TextStyle(fontSize: widget.size),
        cursorWidth: widget.withCursor ? 2.0 : 0,
        scrollPadding: kInputScrollPadding,
      ),
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: context.theme.colorScheme.primary,
            width: 2,
          ),
        ),
        constraints: const BoxConstraints(
          maxHeight: 300,
        ),
      ),
      transitionBuilder: transitionBuilder,
      animationStart: 0.2,
      loadingBuilder: loadingBuilder,
      debounceDuration: widget.noUpdateOnType ? const Duration(days: 1) : const Duration(milliseconds: 400),
      suggestionsBoxVerticalOffset: widget.suggestionOffset,
      hideOnLoading: true,
      noItemsFoundBuilder: widget.notFoundBuilder ?? notFoundBuilderDefault,
      keepSuggestionsOnSuggestionSelected: widget.closeOnSelect == false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: groupOfValidators([
        if (widget.isRequired) isRequiredValidator,
        if (widget.validator != null) widget.validator!,
      ]),
    );
  }
}
