import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'diagnostics.g.dart';

@JsonSerializable()
class Diagnostics {
  Diagnostics({
    required this.devToolsSnapshot,
    required this.devToolsVersion,
    required this.connectedApp,
    required this.activeScreenId,
    required this.performance,
    required this.traceEvents,
  });

  factory Diagnostics.fromJson(dynamic json) => _$DiagnosticsFromJson(castToJson(json));

  final bool? devToolsSnapshot;
  final String? devToolsVersion;
  final ConnectedApp? connectedApp;
  final String? activeScreenId;
  final Performance? performance;
  final List<TraceEvent>? traceEvents;

  Json toJson() => _$DiagnosticsToJson(this);
}

@JsonSerializable()
class ConnectedApp {
  ConnectedApp({
    required this.isFlutterApp,
    required this.isProfileBuild,
    required this.isDartWebApp,
    required this.isRunningOnDartVm,
    required this.operatingSystem,
    required this.flutterVersion,
  });

  factory ConnectedApp.fromJson(dynamic json) => _$ConnectedAppFromJson(castToJson(json));

  final bool? isFlutterApp;
  final bool? isProfileBuild;
  final bool? isDartWebApp;
  final bool? isRunningOnDartVm;
  final String? operatingSystem;
  final String? flutterVersion;

  Json toJson() => _$ConnectedAppToJson(this);
}

@JsonSerializable()
class Performance {
  Performance({
    required this.selectedFrameId,
    required this.flutterFrames,
    required this.displayRefreshRate,
    required this.selectedEvent,
    required this.cpuProfile,
    required this.rasterStats,
    required this.rebuildCountModel,
  });

  factory Performance.fromJson(dynamic json) => _$PerformanceFromJson(castToJson(json));

  final dynamic selectedFrameId;
  final List<FlutterFrame>? flutterFrames;
  final int? displayRefreshRate;
  final CpuProfile? selectedEvent;
  final CpuProfile? cpuProfile;
  final CpuProfile? rasterStats;
  final dynamic rebuildCountModel;

  Json toJson() => _$PerformanceToJson(this);
}

@JsonSerializable()
class CpuProfile {
  CpuProfile();

  factory CpuProfile.fromJson(dynamic json) => _$CpuProfileFromJson(castToJson(json));

  Json toJson() => _$CpuProfileToJson(this);
}

@JsonSerializable()
class FlutterFrame {
  FlutterFrame({
    required this.number,
    required this.startTime,
    required this.elapsed,
    required this.build,
    required this.raster,
    required this.vsyncOverhead,
  });

  factory FlutterFrame.fromJson(dynamic json) => _$FlutterFrameFromJson(castToJson(json));

  final int number;
  final int startTime;
  final int elapsed;
  final int build;
  final int raster;
  final int vsyncOverhead;

  Json toJson() => _$FlutterFrameToJson(this);
}

@JsonSerializable()
class TraceEvent {
  TraceEvent({
    required this.name,
    required this.pid,
    required this.tid,
    required this.args,
    this.ts,
    this.s,
    this.id,
  });

  factory TraceEvent.fromJson(dynamic json) => _$TraceEventFromJson(castToJson(json));

  final String? name;
  final int? pid;
  final int? tid;
  final Args? args;
  final int? ts;
  final String? s;
  final String? id;

  Json toJson() => _$TraceEventToJson(this);
}

@JsonSerializable()
class Args {
  Args({
    this.name,
    this.reason,
    this.beforeCombinedUsedKB,
    this.afterCombinedUsedKB,
    this.hardThresholdKB,
    this.softThresholdKB,
    this.idleThresholdKB,
    this.beforeNewUsedKB,
    this.afterNewUsedKB,
    this.beforeOldUsedKB,
    this.afterOldUsedKB,
    this.beforeNewCapacityKB,
    this.afterNewCapacityKB,
    this.beforeOldCapacityKB,
    this.afterOldCapacityKB,
    this.beforeNewExternalKB,
    this.afterNewExternalKB,
    this.beforeOldExternalKB,
    this.afterOldExternalKB,
    this.frameStartTime,
    this.frameTargetTime,
    this.startTime,
    this.targetTime,
    this.frameNumber,
    this.framesInFlight,
    this.count,
    this.successful,
    this.channel,
    this.layerCount,
    this.layerMBytes,
    this.pictureCount,
    this.pictureMBytes,
    this.currentFrameTargetTime,
    this.vsyncTransitionsMissed,
  });

  factory Args.fromJson(dynamic json) => _$ArgsFromJson(castToJson(json));

  final String? name;
  final String? reason;
  final String? beforeCombinedUsedKB;
  final String? afterCombinedUsedKB;
  final String? hardThresholdKB;
  final String? softThresholdKB;
  final String? idleThresholdKB;
  final String? beforeNewUsedKB;
  final String? afterNewUsedKB;
  final String? beforeOldUsedKB;
  final String? afterOldUsedKB;
  final String? beforeNewCapacityKB;
  final String? afterNewCapacityKB;
  final String? beforeOldCapacityKB;
  final String? afterOldCapacityKB;
  final String? beforeNewExternalKB;
  final String? afterNewExternalKB;
  final String? beforeOldExternalKB;
  final String? afterOldExternalKB;
  final String? frameStartTime;
  final String? frameTargetTime;
  final String? startTime;
  final String? targetTime;
  final String? frameNumber;
  final String? framesInFlight;
  final String? count;
  final String? successful;
  final String? channel;
  final String? layerCount;
  final String? layerMBytes;
  final String? pictureCount;
  final String? pictureMBytes;
  final String? currentFrameTargetTime;
  final String? vsyncTransitionsMissed;

  Json toJson() => _$ArgsToJson(this);
}
