// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowArguments _$ShowArgumentsFromJson(Map<String, dynamic> json) =>
    ShowArguments(
      show: nullableBoolFromJson(json['show']),
      notShow: nullableBoolFromJson(json['notShow']),
    );

Map<String, dynamic> _$ShowArgumentsToJson(ShowArguments instance) =>
    <String, dynamic>{
      'show': instance.show,
      'notShow': instance.notShow,
    };
