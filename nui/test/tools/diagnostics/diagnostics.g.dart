// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diagnostics _$DiagnosticsFromJson(Map<String, dynamic> json) => Diagnostics(
      devToolsSnapshot: json['devToolsSnapshot'] as bool?,
      devToolsVersion: json['devToolsVersion'] as String?,
      connectedApp: json['connectedApp'] == null
          ? null
          : ConnectedApp.fromJson(json['connectedApp']),
      activeScreenId: json['activeScreenId'] as String?,
      performance: json['performance'] == null
          ? null
          : Performance.fromJson(json['performance']),
      traceEvents: (json['traceEvents'] as List<dynamic>?)
          ?.map(TraceEvent.fromJson)
          .toList(),
    );

Map<String, dynamic> _$DiagnosticsToJson(Diagnostics instance) =>
    <String, dynamic>{
      'devToolsSnapshot': instance.devToolsSnapshot,
      'devToolsVersion': instance.devToolsVersion,
      'connectedApp': instance.connectedApp?.toJson(),
      'activeScreenId': instance.activeScreenId,
      'performance': instance.performance?.toJson(),
      'traceEvents': instance.traceEvents?.map((e) => e.toJson()).toList(),
    };

ConnectedApp _$ConnectedAppFromJson(Map<String, dynamic> json) => ConnectedApp(
      isFlutterApp: json['isFlutterApp'] as bool?,
      isProfileBuild: json['isProfileBuild'] as bool?,
      isDartWebApp: json['isDartWebApp'] as bool?,
      isRunningOnDartVm: json['isRunningOnDartVm'] as bool?,
      operatingSystem: json['operatingSystem'] as String?,
      flutterVersion: json['flutterVersion'] as String?,
    );

Map<String, dynamic> _$ConnectedAppToJson(ConnectedApp instance) =>
    <String, dynamic>{
      'isFlutterApp': instance.isFlutterApp,
      'isProfileBuild': instance.isProfileBuild,
      'isDartWebApp': instance.isDartWebApp,
      'isRunningOnDartVm': instance.isRunningOnDartVm,
      'operatingSystem': instance.operatingSystem,
      'flutterVersion': instance.flutterVersion,
    };

Performance _$PerformanceFromJson(Map<String, dynamic> json) => Performance(
      selectedFrameId: json['selectedFrameId'],
      flutterFrames: (json['flutterFrames'] as List<dynamic>?)
          ?.map(FlutterFrame.fromJson)
          .toList(),
      displayRefreshRate: json['displayRefreshRate'] as int?,
      selectedEvent: json['selectedEvent'] == null
          ? null
          : CpuProfile.fromJson(json['selectedEvent']),
      cpuProfile: json['cpuProfile'] == null
          ? null
          : CpuProfile.fromJson(json['cpuProfile']),
      rasterStats: json['rasterStats'] == null
          ? null
          : CpuProfile.fromJson(json['rasterStats']),
      rebuildCountModel: json['rebuildCountModel'],
    );

Map<String, dynamic> _$PerformanceToJson(Performance instance) =>
    <String, dynamic>{
      'selectedFrameId': instance.selectedFrameId,
      'flutterFrames': instance.flutterFrames?.map((e) => e.toJson()).toList(),
      'displayRefreshRate': instance.displayRefreshRate,
      'selectedEvent': instance.selectedEvent?.toJson(),
      'cpuProfile': instance.cpuProfile?.toJson(),
      'rasterStats': instance.rasterStats?.toJson(),
      'rebuildCountModel': instance.rebuildCountModel,
    };

CpuProfile _$CpuProfileFromJson(Map<String, dynamic> json) => CpuProfile();

Map<String, dynamic> _$CpuProfileToJson(CpuProfile instance) =>
    <String, dynamic>{};

FlutterFrame _$FlutterFrameFromJson(Map<String, dynamic> json) => FlutterFrame(
      number: json['number'] as int,
      startTime: json['startTime'] as int,
      elapsed: json['elapsed'] as int,
      build: json['build'] as int,
      raster: json['raster'] as int,
      vsyncOverhead: json['vsyncOverhead'] as int,
    );

Map<String, dynamic> _$FlutterFrameToJson(FlutterFrame instance) =>
    <String, dynamic>{
      'number': instance.number,
      'startTime': instance.startTime,
      'elapsed': instance.elapsed,
      'build': instance.build,
      'raster': instance.raster,
      'vsyncOverhead': instance.vsyncOverhead,
    };

TraceEvent _$TraceEventFromJson(Map<String, dynamic> json) => TraceEvent(
      name: json['name'] as String?,
      pid: json['pid'] as int?,
      tid: json['tid'] as int?,
      args: json['args'] == null ? null : Args.fromJson(json['args']),
      ts: json['ts'] as int?,
      s: json['s'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TraceEventToJson(TraceEvent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pid': instance.pid,
      'tid': instance.tid,
      'args': instance.args?.toJson(),
      'ts': instance.ts,
      's': instance.s,
      'id': instance.id,
    };

Args _$ArgsFromJson(Map<String, dynamic> json) => Args(
      name: json['name'] as String?,
      reason: json['reason'] as String?,
      beforeCombinedUsedKB: json['beforeCombinedUsedKB'] as String?,
      afterCombinedUsedKB: json['afterCombinedUsedKB'] as String?,
      hardThresholdKB: json['hardThresholdKB'] as String?,
      softThresholdKB: json['softThresholdKB'] as String?,
      idleThresholdKB: json['idleThresholdKB'] as String?,
      beforeNewUsedKB: json['beforeNewUsedKB'] as String?,
      afterNewUsedKB: json['afterNewUsedKB'] as String?,
      beforeOldUsedKB: json['beforeOldUsedKB'] as String?,
      afterOldUsedKB: json['afterOldUsedKB'] as String?,
      beforeNewCapacityKB: json['beforeNewCapacityKB'] as String?,
      afterNewCapacityKB: json['afterNewCapacityKB'] as String?,
      beforeOldCapacityKB: json['beforeOldCapacityKB'] as String?,
      afterOldCapacityKB: json['afterOldCapacityKB'] as String?,
      beforeNewExternalKB: json['beforeNewExternalKB'] as String?,
      afterNewExternalKB: json['afterNewExternalKB'] as String?,
      beforeOldExternalKB: json['beforeOldExternalKB'] as String?,
      afterOldExternalKB: json['afterOldExternalKB'] as String?,
      frameStartTime: json['frameStartTime'] as String?,
      frameTargetTime: json['frameTargetTime'] as String?,
      startTime: json['startTime'] as String?,
      targetTime: json['targetTime'] as String?,
      frameNumber: json['frameNumber'] as String?,
      framesInFlight: json['framesInFlight'] as String?,
      count: json['count'] as String?,
      successful: json['successful'] as String?,
      channel: json['channel'] as String?,
      layerCount: json['layerCount'] as String?,
      layerMBytes: json['layerMBytes'] as String?,
      pictureCount: json['pictureCount'] as String?,
      pictureMBytes: json['pictureMBytes'] as String?,
      currentFrameTargetTime: json['currentFrameTargetTime'] as String?,
      vsyncTransitionsMissed: json['vsyncTransitionsMissed'] as String?,
    );

Map<String, dynamic> _$ArgsToJson(Args instance) => <String, dynamic>{
      'name': instance.name,
      'reason': instance.reason,
      'beforeCombinedUsedKB': instance.beforeCombinedUsedKB,
      'afterCombinedUsedKB': instance.afterCombinedUsedKB,
      'hardThresholdKB': instance.hardThresholdKB,
      'softThresholdKB': instance.softThresholdKB,
      'idleThresholdKB': instance.idleThresholdKB,
      'beforeNewUsedKB': instance.beforeNewUsedKB,
      'afterNewUsedKB': instance.afterNewUsedKB,
      'beforeOldUsedKB': instance.beforeOldUsedKB,
      'afterOldUsedKB': instance.afterOldUsedKB,
      'beforeNewCapacityKB': instance.beforeNewCapacityKB,
      'afterNewCapacityKB': instance.afterNewCapacityKB,
      'beforeOldCapacityKB': instance.beforeOldCapacityKB,
      'afterOldCapacityKB': instance.afterOldCapacityKB,
      'beforeNewExternalKB': instance.beforeNewExternalKB,
      'afterNewExternalKB': instance.afterNewExternalKB,
      'beforeOldExternalKB': instance.beforeOldExternalKB,
      'afterOldExternalKB': instance.afterOldExternalKB,
      'frameStartTime': instance.frameStartTime,
      'frameTargetTime': instance.frameTargetTime,
      'startTime': instance.startTime,
      'targetTime': instance.targetTime,
      'frameNumber': instance.frameNumber,
      'framesInFlight': instance.framesInFlight,
      'count': instance.count,
      'successful': instance.successful,
      'channel': instance.channel,
      'layerCount': instance.layerCount,
      'layerMBytes': instance.layerMBytes,
      'pictureCount': instance.pictureCount,
      'pictureMBytes': instance.pictureMBytes,
      'currentFrameTargetTime': instance.currentFrameTargetTime,
      'vsyncTransitionsMissed': instance.vsyncTransitionsMissed,
    };
