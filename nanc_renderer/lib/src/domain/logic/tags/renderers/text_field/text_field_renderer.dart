import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../logic/event_delegate.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import 'text_field_arguments.dart';

TagRenderer textFieldRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_focus_field,
    tagType: TagType.widget,
    tag: 'textField',
    description: TagDescription(
      description: '''
# [Text field](https://api.flutter.dev/flutter/material/TextFormField-class.html)

> This widget is in active development and some API might be changed

A [FormField](widgets/FormField-class.html) that contains a [TextField](material/TextField-class.html).

This is a convenience widget that wraps a [TextField](material/TextField-class.html) widget in a [FormField](widgets/FormField-class.html).

A [Form](widgets/Form-class.html) ancestor is not required. The [Form](widgets/Form-class.html) allows one to save, reset, or validate multiple fields at once. To use without a [Form](widgets/Form-class.html), pass a `GlobalKey<FormFieldState>` (see [GlobalKey](widgets/GlobalKey-class.html)) to the constructor and use [GlobalKey.currentState](widgets/GlobalKey/currentState.html) to save or reset the form field.

When a [controller](material/TextFormField/controller.html) is specified, its [TextEditingController.text](widgets/TextEditingController/text.html) defines the [initialValue](widgets/FormField/initialValue.html). If this [FormField](widgets/FormField-class.html) is part of a scrolling container that lazily constructs its children, like a [ListView](widgets/ListView-class.html) or a [CustomScrollView](widgets/CustomScrollView-class.html), then a [controller](material/TextFormField/controller.html) should be specified. The controller's lifetime should be managed by a stateful widget ancestor of the scrolling container.

If a [controller](material/TextFormField/controller.html) is not specified, [initialValue](widgets/FormField/initialValue.html) can be used to give the automatically generated controller an initial value.

When the widget has focus, it will prevent itself from disposing via its underlying [EditableText](widgets/EditableText-class.html)'s [AutomaticKeepAliveClientMixin.wantKeepAlive](widgets/AutomaticKeepAliveClientMixin/wantKeepAlive.html) in order to avoid losing the selection. Removing the focus will allow it to be disposed.

Remember to call [TextEditingController.dispose](foundation/ChangeNotifier/dispose.html) of the [TextEditingController](widgets/TextEditingController-class.html) when it is no longer needed. This will ensure any resources used by the object are discarded.

By default, `decoration` will apply the [ThemeData.inputDecorationTheme](material/ThemeData/inputDecorationTheme.html) for the current context to the [InputDecoration](material/InputDecoration-class.html), see [InputDecoration.applyDefaults](material/InputDecoration/applyDefaults.html).

For a documentation about the various parameters, see [TextField](material/TextField-class.html).
      ''',
      arguments: [
        textAlignArgument(),
        maxLinesArgument(),
        textDirectionArgument(),
        clipArgument(name: 'clip'),
        eventArgument(name: 'onTap'),
        eventArgument(name: 'onChanged'),
        boolArgument(name: 'autocorrect'),
        boolArgument(name: 'autofocus'),
        autovalidateModeArgument(name: 'autovalidateMode'),
        boolArgument(name: 'canRequestFocus'),
        colorArgument(name: 'cursorColor'),
        doubleArgument(name: 'cursorHeight'),
        boolArgument(name: 'cursorOpacityAnimates'),
        doubleArgument(name: 'cursorRadius'),
        doubleArgument(name: 'cursorWidth'),
        boolArgument(name: 'enabled'),
        boolArgument(name: 'expands'),
        boolArgument(name: 'enableSuggestions'),
        stringArgument(name: 'initialValue'),
        brightnessArgument(name: 'keyboardAppearance'),
        textInputTypeArgument(name: 'keyboardType'),
        intArgument(name: 'maxLength'),
        intArgument(name: 'minLines'),
        cursorArgument(),
        boolArgument(name: 'obscureText'),
        stringArgument(name: 'obscuringCharacter'),
        eventArgument(name: 'onEditingComplete'),
        eventArgument(name: 'onFieldSubmitted'),
        eventArgument(name: 'onSaved'),
        boolArgument(name: 'readOnly'),
        boolArgument(name: 'scribbleEnabled'),
        doubleArgument(name: 'scrollPadding'),
        physicsArgument(name: 'physics'),
        boolArgument(name: 'showCursor'),
        textCapitalizationArgument(name: 'textCapitalization'),
        textInputActionArgument(name: 'textInputAction'),
      ],
      properties: [
        textStyleProp(),
        strutStyleProp(),
        inputDecorationProp(name: inputDecoration),
      ],
    ),
    example: '''
<safeArea>
  <padding left="8" right="8">
    <textField onChanged="emit:test_field" initialValue="50">
      <prop:inputDecoration label="Type some text here" errorText="There are some error">
        <prop:inputBorder type="outline"/>
      </prop:inputDecoration>
    </textField>
  </padding>
  
  <sizedBox height="8"/>
  
  <padding left="8" right="8">
    <dataBuilder buildWhen="test_field" onUpdate="test_field_updated">
      <text>
        You typed "{{ storage.test_field }}"
      </text>
    </dataBuilder>
  </padding>
  
  <sizedBox height="8"/>
  
  <dataBuilder buildWhen="test_field" >
    <for from="0" to="{{ storage.test_field }}">
      <padding left="8" right="8" bottom="8">
        <text text="Item #{{ cycle.index }}"/>
      </padding>
    </for>
  </dataBuilder>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final TextFieldArguments arguments = TextFieldArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (arguments.initialValue != null && arguments.onChanged != null) {
        unawaited(handleEvent(context: context, event: arguments.onChanged, meta: {'value': arguments.initialValue})?.call());
      }

      final InputDecoration? decoration = extractor.getProperty(inputDecoration);

      return TextFormField(
        textAlign: arguments.align ?? TextAlign.start,
        style: extractor.getProperty(textStyle),
        strutStyle: extractor.getProperty(strutStyle),
        maxLines: arguments.maxLines,
        textDirection: arguments.textDirection,
        clipBehavior: arguments.clip ?? Clip.hardEdge,
        decoration: decoration,
        onTap: handleEvent(context: context, event: arguments.onTap),
        onChanged: (String value) async => handleEvent(
          context: context,
          event: arguments.onChanged,
          meta: {
            'value': value,
          },
        )?.call(),
        autocorrect: arguments.autocorrect ?? true,
        autofocus: arguments.autofocus ?? false,
        autovalidateMode: arguments.autovalidateMode,
        canRequestFocus: arguments.canRequestFocus ?? true,
        cursorColor: arguments.cursorColor,
        cursorHeight: arguments.cursorHeight,
        cursorOpacityAnimates: arguments.cursorOpacityAnimates,
        cursorRadius: arguments.cursorRadius == null ? null : Radius.circular(arguments.cursorRadius!),
        cursorWidth: arguments.cursorWidth ?? 2,
        enabled: arguments.enabled,
        expands: arguments.expands ?? false,
        enableSuggestions: arguments.enableSuggestions ?? true,
        initialValue: arguments.initialValue,
        keyboardAppearance: arguments.keyboardAppearance,
        keyboardType: arguments.keyboardType?.toTextInputType(),
        maxLength: arguments.maxLength,
        minLines: arguments.minLines,
        mouseCursor: arguments.cursor?.toMouseCursor(),
        obscureText: arguments.obscureText ?? false,
        obscuringCharacter: arguments.obscuringCharacter ?? '•',
        onEditingComplete: handleEvent(
          context: context,
          event: arguments.onEditingComplete,
        ),
        onFieldSubmitted: (String value) async => handleEvent(
          context: context,
          event: arguments.onFieldSubmitted,
          meta: {
            'value': value,
          },
        )?.call(),
        onSaved: (String? value) async => handleEvent(
          context: context,
          event: arguments.onFieldSubmitted,
          meta: {
            'value': value,
          },
        )?.call(),
        onTapOutside: (PointerDownEvent value) async => handleEvent(
          context: context,
          event: arguments.onFieldSubmitted,
          meta: {
            'value': value,
          },
        )?.call(),
        readOnly: arguments.readOnly ?? false,
        scribbleEnabled: arguments.scribbleEnabled ?? true,
        scrollPadding: arguments.scrollPadding == null
            ? const EdgeInsets.all(20)
            : EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: arguments.scrollPadding!,
              ),
        scrollPhysics: arguments.physics?.toScrollPhysics(),
        showCursor: arguments.showCursor,
        textCapitalization: arguments.textCapitalization ?? TextCapitalization.none,
        textInputAction: arguments.textInputAction,

        /// ? Don't needed
        // undoController: arguments.undoController,
        // contentInsertionConfiguration: arguments.contentInsertionConfiguration,
        // smartDashesType: arguments.smartDashesType,
        // smartQuotesType: arguments.smartQuotesType,
        // spellCheckConfiguration: arguments.spellCheckConfiguration,
        // textAlignVertical: arguments.textAlignVertical,
        // selectionControls: arguments.selectionControls,
        // selectionHeightStyle: arguments.selectionHeightStyle,
        // selectionWidthStyle: arguments.selectionWidthStyle,
        // maxLengthEnforcement: arguments.maxLengthEnforcement,
        // onAppPrivateCommand: arguments.onAppPrivateCommand,
        // magnifierConfiguration: arguments.magnifierConfiguration,
        // dragStartBehavior: arguments.dragStartBehavior,
        // enableIMEPersonalizedLearning: arguments.enableIMEPersonalizedLearning,
        // enableInteractiveSelection: arguments.enableInteractiveSelection,

        // TODO(alphamikle): Think about TextEditingControllerStorage
        // controller: arguments.controller,
        // TODO(alphamikle): Will be possible after dynamic evaluation of Dart code
        // validator: arguments.validator,
        // TODO(alphamikle): Think about FocusNodeStorage
        // focusNode: arguments.focusNode,
        // TODO(alphamikle): Will be possible after dynamic evaluation of Dart code
        // inputFormatters: arguments.formatters,
        // TODO(alphamikle): Think about ScrollControllerStorage
        // scrollController: arguments.scrollController,
        // TODO(alphamikle): Builder tags (see Trello)
        // contextMenuBuilder: arguments.contextMenuBuilder,
        // TODO(alphamikle): Builder tags (see Trello)
        // buildCounter: arguments.buildCounter,
        // TODO(alphamikle): Think, how to implement this param
        // autofillHints: arguments.autofillHints,
      );
    },
  );
}
