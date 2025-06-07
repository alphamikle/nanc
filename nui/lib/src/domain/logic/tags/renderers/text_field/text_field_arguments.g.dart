// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_field_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextFieldArguments _$TextFieldArgumentsFromJson(Map<String, dynamic> json) =>
    TextFieldArguments(
      align: $enumDecodeNullable(_$TextAlignEnumMap, json['align'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      maxLines: nullableIntFromJson(json['maxLines']),
      textDirection: $enumDecodeNullable(
          _$TextDirectionEnumMap, json['textDirection'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      clip: $enumDecodeNullable(_$ClipEnumMap, json['clip'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      onTap: json['onTap'] as String?,
      onChanged: json['onChanged'] as String?,
      autocorrect: nullableBoolFromJson(json['autocorrect']),
      autofocus: nullableBoolFromJson(json['autofocus']),
      autovalidateMode: $enumDecodeNullable(
          _$AutovalidateModeEnumMap, json['autovalidateMode'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      canRequestFocus: nullableBoolFromJson(json['canRequestFocus']),
      cursorColor: nullableColorFromJson(json['cursorColor'] as String?),
      cursorHeight: nullableDoubleFromJson(json['cursorHeight']),
      cursorOpacityAnimates:
          nullableBoolFromJson(json['cursorOpacityAnimates']),
      cursorRadius: nullableDoubleFromJson(json['cursorRadius']),
      cursorWidth: nullableDoubleFromJson(json['cursorWidth']),
      enabled: nullableBoolFromJson(json['enabled']),
      expands: nullableBoolFromJson(json['expands']),
      enableSuggestions: nullableBoolFromJson(json['enableSuggestions']),
      initialValue: json['initialValue'] as String?,
      keyboardAppearance: $enumDecodeNullable(
          _$BrightnessEnumMap, json['keyboardAppearance'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      keyboardType: $enumDecodeNullable(
          _$TextInputTypeEnumEnumMap, json['keyboardType'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      maxLength: nullableIntFromJson(json['maxLength']),
      minLines: nullableIntFromJson(json['minLines']),
      cursor: $enumDecodeNullable(_$MouseCursorEnumEnumMap, json['cursor'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      obscureText: nullableBoolFromJson(json['obscureText']),
      obscuringCharacter: json['obscuringCharacter'] as String?,
      onEditingComplete: json['onEditingComplete'] as String?,
      onFieldSubmitted: json['onFieldSubmitted'] as String?,
      onSaved: json['onSaved'] as String?,
      readOnly: nullableBoolFromJson(json['readOnly']),
      scribbleEnabled: nullableBoolFromJson(json['scribbleEnabled']),
      scrollPadding: nullableDoubleFromJson(json['scrollPadding']),
      physics: $enumDecodeNullable(_$ScrollPhysicsEnumEnumMap, json['physics'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      showCursor: nullableBoolFromJson(json['showCursor']),
      textCapitalization: $enumDecodeNullable(
          _$TextCapitalizationEnumMap, json['textCapitalization'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      textInputAction: $enumDecodeNullable(
          _$TextInputActionEnumMap, json['textInputAction'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      onTapOutside: json['onTapOutside'] as String?,
    );

Map<String, dynamic> _$TextFieldArgumentsToJson(TextFieldArguments instance) =>
    <String, dynamic>{
      'align': _$TextAlignEnumMap[instance.align],
      'maxLines': instance.maxLines,
      'textDirection': _$TextDirectionEnumMap[instance.textDirection],
      'clip': _$ClipEnumMap[instance.clip],
      'onTap': instance.onTap,
      'onChanged': instance.onChanged,
      'autocorrect': instance.autocorrect,
      'autofocus': instance.autofocus,
      'autovalidateMode': _$AutovalidateModeEnumMap[instance.autovalidateMode],
      'canRequestFocus': instance.canRequestFocus,
      'cursorColor': colorToJson(instance.cursorColor),
      'cursorHeight': instance.cursorHeight,
      'cursorOpacityAnimates': instance.cursorOpacityAnimates,
      'cursorRadius': instance.cursorRadius,
      'cursorWidth': instance.cursorWidth,
      'enabled': instance.enabled,
      'expands': instance.expands,
      'enableSuggestions': instance.enableSuggestions,
      'initialValue': instance.initialValue,
      'keyboardAppearance': _$BrightnessEnumMap[instance.keyboardAppearance],
      'keyboardType': _$TextInputTypeEnumEnumMap[instance.keyboardType],
      'maxLength': instance.maxLength,
      'minLines': instance.minLines,
      'cursor': _$MouseCursorEnumEnumMap[instance.cursor],
      'obscureText': instance.obscureText,
      'obscuringCharacter': instance.obscuringCharacter,
      'onEditingComplete': instance.onEditingComplete,
      'onTapOutside': instance.onTapOutside,
      'onFieldSubmitted': instance.onFieldSubmitted,
      'onSaved': instance.onSaved,
      'readOnly': instance.readOnly,
      'scribbleEnabled': instance.scribbleEnabled,
      'scrollPadding': instance.scrollPadding,
      'physics': _$ScrollPhysicsEnumEnumMap[instance.physics],
      'showCursor': instance.showCursor,
      'textCapitalization':
          _$TextCapitalizationEnumMap[instance.textCapitalization],
      'textInputAction': _$TextInputActionEnumMap[instance.textInputAction],
    };

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};

const _$TextDirectionEnumMap = {
  TextDirection.rtl: 'rtl',
  TextDirection.ltr: 'ltr',
};

const _$ClipEnumMap = {
  Clip.none: 'none',
  Clip.hardEdge: 'hardEdge',
  Clip.antiAlias: 'antiAlias',
  Clip.antiAliasWithSaveLayer: 'antiAliasWithSaveLayer',
};

const _$AutovalidateModeEnumMap = {
  AutovalidateMode.disabled: 'disabled',
  AutovalidateMode.always: 'always',
  AutovalidateMode.onUserInteraction: 'onUserInteraction',
  AutovalidateMode.onUnfocus: 'onUnfocus',
};

const _$BrightnessEnumMap = {
  Brightness.dark: 'dark',
  Brightness.light: 'light',
};

const _$TextInputTypeEnumEnumMap = {
  TextInputTypeEnum.text: 'text',
  TextInputTypeEnum.multiline: 'multiline',
  TextInputTypeEnum.number: 'number',
  TextInputTypeEnum.phone: 'phone',
  TextInputTypeEnum.datetime: 'datetime',
  TextInputTypeEnum.email: 'email',
  TextInputTypeEnum.url: 'url',
  TextInputTypeEnum.password: 'password',
  TextInputTypeEnum.name: 'name',
  TextInputTypeEnum.address: 'address',
};

const _$MouseCursorEnumEnumMap = {
  MouseCursorEnum.none: 'none',
  MouseCursorEnum.basic: 'basic',
  MouseCursorEnum.click: 'click',
  MouseCursorEnum.forbidden: 'forbidden',
  MouseCursorEnum.wait: 'wait',
  MouseCursorEnum.progress: 'progress',
  MouseCursorEnum.contextMenu: 'contextMenu',
  MouseCursorEnum.help: 'help',
  MouseCursorEnum.text: 'text',
  MouseCursorEnum.verticalText: 'verticalText',
  MouseCursorEnum.cell: 'cell',
  MouseCursorEnum.precise: 'precise',
  MouseCursorEnum.move: 'move',
  MouseCursorEnum.grab: 'grab',
  MouseCursorEnum.grabbing: 'grabbing',
  MouseCursorEnum.noDrop: 'noDrop',
  MouseCursorEnum.alias: 'alias',
  MouseCursorEnum.copy: 'copy',
  MouseCursorEnum.disappearing: 'disappearing',
  MouseCursorEnum.allScroll: 'allScroll',
  MouseCursorEnum.zoomIn: 'zoomIn',
  MouseCursorEnum.zoomOut: 'zoomOut',
};

const _$ScrollPhysicsEnumEnumMap = {
  ScrollPhysicsEnum.always: 'always',
  ScrollPhysicsEnum.bouncing: 'bouncing',
  ScrollPhysicsEnum.clamping: 'clamping',
  ScrollPhysicsEnum.fixedExtent: 'fixedExtent',
  ScrollPhysicsEnum.never: 'never',
  ScrollPhysicsEnum.page: 'page',
  ScrollPhysicsEnum.range: 'range',
};

const _$TextCapitalizationEnumMap = {
  TextCapitalization.words: 'words',
  TextCapitalization.sentences: 'sentences',
  TextCapitalization.characters: 'characters',
  TextCapitalization.none: 'none',
};

const _$TextInputActionEnumMap = {
  TextInputAction.none: 'none',
  TextInputAction.unspecified: 'unspecified',
  TextInputAction.done: 'done',
  TextInputAction.go: 'go',
  TextInputAction.search: 'search',
  TextInputAction.send: 'send',
  TextInputAction.next: 'next',
  TextInputAction.previous: 'previous',
  TextInputAction.continueAction: 'continueAction',
  TextInputAction.join: 'join',
  TextInputAction.route: 'route',
  TextInputAction.emergencyCall: 'emergencyCall',
  TextInputAction.newline: 'newline',
};
