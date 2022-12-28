// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessInfoDto _$AccessInfoDtoFromJson(Map<String, dynamic> json) =>
    AccessInfoDto(
      appName: json['app_name'] as String,
      accessToken: json['access_token'] as String,
      uuid: json['dtable_uuid'] as String,
      workspaceId: json['workspace_id'] as int,
    );

Map<String, dynamic> _$AccessInfoDtoToJson(AccessInfoDto instance) =>
    <String, dynamic>{
      'app_name': instance.appName,
      'access_token': instance.accessToken,
      'workspace_id': instance.workspaceId,
      'dtable_uuid': instance.uuid,
    };
