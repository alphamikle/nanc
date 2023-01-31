import 'dart:async';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:config/config.dart';
import 'package:tools/tools.dart';

const String _kAnalyticsUserIdKey = 'USER_ID';
final logger = logg.raw('ANALYTICS');

abstract class Analytics {
  Analytics._();

  static bool _wasInitialized = false;
  static bool _analyticsIsDisabled = false;
  static late final Amplitude _amplitude;

  static Future<void> _init() async {
    if (_wasInitialized || _analyticsIsDisabled) {
      return;
    }
    try {
      _wasInitialized = true;
      if (Env.analyticsKey.isEmpty) {
        _analyticsIsDisabled = true;
        logger('DISABLING ANALYTICS DUE TO EMPTY ANALYTICS KEY...');
        return;
      }
      final DbService dbService = createDbService();
      late final String userId;
      if (await dbService.has(_kAnalyticsUserIdKey)) {
        final String? nullableUserId = await dbService.get(_kAnalyticsUserIdKey);
        if (nullableUserId == null) {
          userId = generateEventHash();
        } else {
          userId = nullableUserId;
        }
      } else {
        userId = generateEventHash();
      }
      _amplitude = Amplitude.getInstance(instanceName: Env.analyticsProject);
      await _amplitude.init(Env.analyticsKey);
      await _amplitude.enableCoppaControl();
      await _amplitude.setUserId(userId, startNewSession: false);
      await _amplitude.trackingSessionEvents(true);
    } catch (error) {
      logger('ERROR WAS THROWN ON ANALYTICS INITIALIZATION: $error');
      _analyticsIsDisabled = true;
    }
  }

  static Future<void> _sendEvent(String event, {Map<String, dynamic>? data}) async {
    await _init();
    if (_analyticsIsDisabled) {
      logger('ANALYTICS IS DISABLED: event: $event, data: $data');
      return;
    }
    try {
      await _amplitude.logEvent(
        event,
        eventProperties: data,
      );
      logger('$event | $data');
    } catch (error) {
      logger('ANALYTICS EVENT SENDING DID\'NT SUCCEED: $error, event: $event, data: $data');
    }
  }

  static void sendEvent(String event, {Map<String, dynamic>? data}) => unawaited(_sendEvent(event, data: data));
}
