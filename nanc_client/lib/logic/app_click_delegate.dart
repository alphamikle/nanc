import 'package:flutter/material.dart';
import 'package:rich_renderer/rich_renderer.dart' as r;
import 'package:url_launcher/url_launcher_string.dart';

const String browser = 'browser:';

class AppClickDelegate {
  factory AppClickDelegate({required BuildContext context}) => _instance ??= AppClickDelegate._(context: context);

  AppClickDelegate._({required this.context});

  static AppClickDelegate? _instance;

  final BuildContext context;

  Future<void> handler(String argument) async {
    if (argument.startsWith(browser)) {
      await _browserLinksHandler(argument.replaceFirst(browser, ''));
    }
  }

  Future<void> _browserLinksHandler(String link) async => launchUrlString(link);
}

r.Action clickHandler(BuildContext context) {
  final AppClickDelegate delegate = AppClickDelegate(context: context);
  return delegate.handler;
}
