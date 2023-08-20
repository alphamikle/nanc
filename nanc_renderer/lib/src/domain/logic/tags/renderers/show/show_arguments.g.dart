// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowArguments _$ShowArgumentsFromJson(Map<String, dynamic> json) =>
    ShowArguments(
      ifTrue: nullableBoolFromJson(json['ifTrue']),
      ifFalse: nullableBoolFromJson(json['ifFalse']),
      nullAsFalse: nullableBoolFromJson(json['nullAsFalse']),
    );

Map<String, dynamic> _$ShowArgumentsToJson(ShowArguments instance) =>
    <String, dynamic>{
      'ifTrue': instance.ifTrue,
      'ifFalse': instance.ifFalse,
      'nullAsFalse': instance.nullAsFalse,
    };
