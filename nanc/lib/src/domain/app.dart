import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:animation_debugger/animation_debugger.dart';
import 'package:config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:icons/icons.dart';
import 'package:local_notifications/local_notifications.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../service/config/cms_config.dart';
import '../service/errors/human_exception.dart';
import '../service/init/initializer.dart';

class App extends StatefulWidget {
  const App({
    required this.config,
    required this.errorStreamController,
    super.key,
  });

  final CmsConfig config;
  final StreamController<HumanException> errorStreamController;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> rootKey = GlobalKey();
  late final Initializer initializer = Initializer(
    config: widget.config,
    rootKey: rootKey,
    errorStreamController: widget.errorStreamController,
  );
  late final Future<bool> result = initializer.init();
  late final StreamSubscription<HumanException> errorStreamSubscription;

  void openLink(String text, String? href, String title) {
    unawaited(launchUrl(Uri.parse(href ?? text)));
  }

  Future<void> showErrorInfo(String errorInfo) async {
    LocalNotificator.show(
      rootKey.currentContext!,
      builder: (GlobalKey<LocalNotificationState> key, AsyncCallback onClose) => LocalNotification(
        key: key,
        onClose: onClose,
        shadeBackground: true,
        width: rootKey.currentContext!.query.size.width * 0.50,
        height: rootKey.currentContext!.query.size.height,
        toastDuration: const Duration(minutes: 2),
        animationDuration: const Duration(milliseconds: 600),
        animation: AnimationType.fromLeft,
        notificationPosition: NotificationPosition.centerLeft,
        child: (_) => Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: Gap.regular, top: Gap.extra, right: Gap.regular, bottom: Gap.regular),
            child: SingleChildScrollView(
              child: MarkdownBody(
                data: errorInfo,
                onTapLink: openLink,
                selectable: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showError(HumanException exception) async {
    logError(exception.humanMessage, error: exception, stackTrace: exception.stackTrace);
    await doSomethingWhen(action: () {}, condition: () => rootKey.currentContext != null && mounted, interval: const Duration(milliseconds: 250), maxTries: 50);
    if (rootKey.currentContext != null) {
      if (mounted) {
        LocalNotificator.show(
          rootKey.currentContext!,
          builder: (GlobalKey<LocalNotificationState> key, AsyncCallback onClose) => LocalNotification(
            key: key,
            onClose: onClose,
            animation: AnimationType.fromBottom,
            width: 400,
            height: 150,
            animationDuration: const Duration(milliseconds: 750),
            notificationPosition: NotificationPosition.bottomLeft,
            toastDuration: const Duration(seconds: Env.isProduction ? 30 : Env.errorDuration),
            progressIndicatorColor: context.theme.colorScheme.error,
            isCloseButtonVisible: false,
            child: (VoidCallback onClose) => Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: Gap.small,
                  child: ColoredBox(color: context.theme.colorScheme.error),
                ),
                Positioned(
                  left: Gap.large + Gap.small,
                  top: Gap.large,
                  right: Gap.large,
                  bottom: Gap.regular,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: KitText(
                      text: exception.humanMessage,
                    ),
                  ),
                ),
                Positioned(
                  top: Gap.small,
                  right: Gap.small,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (exception.hasOriginalMessage || exception.hasStackTrace)
                        IconButton(
                          onPressed: () => showErrorInfo([exception.fullInfo(), exception.errorsStackInfo].where((String it) => it.isNotEmpty).join('\n')),
                          color: rootKey.currentContext!.theme.colorScheme.tertiary,
                          icon: const Icon(IconPack.flu_chat_help_filled),
                        ),
                      IconButton(
                        onPressed: onClose,
                        color: rootKey.currentContext!.theme.colorScheme.error,
                        icon: const Icon(IconPack.mdi_close),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    }
  }

  Widget adminBuilder(BuildContext context, Widget? child) {
    final double width = context.query.size.width;
    final double height = context.query.size.height;
    const double minWidth = 1024;

    Widget cmsApp = child!;
    if (widget.config.adminWrapperBuilder != null) {
      cmsApp = widget.config.adminWrapperBuilder!(context, rootKey, cmsApp);
    }

    if (width < minWidth) {
      return MediaQuery(
        data: context.query.copyWith(size: Size(1024, height)),
        child: cmsApp,
      );
    }
    return cmsApp;
  }

  @override
  void initState() {
    super.initState();
    errorStreamSubscription = widget.errorStreamController.stream.listen(showError);
    Analytics.sendEvent(
      'START_APP',
      data: <String, String>{
        'kind': 'nanc',
        'platform': 'web',
      },
    );
  }

  @override
  void dispose() {
    unawaited(errorStreamSubscription.cancel().then((_) async {
      await widget.errorStreamController.close();
    }));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: result,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data ?? false) {
          return MultiRepositoryProvider(
            providers: initializer.repositoryProviders,
            child: MultiBlocProvider(
              providers: initializer.blocProviders,
              child: Builder(
                builder: (BuildContext context) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    routerConfig: initializer.router,
                    builder: AnimationDebugger.builderWrapper(adminBuilder),
                    theme: themeBuilder(context),
                    darkTheme: themeBuilder(context, dark: true),
                    themeMode: ThemeMode.light,
                    title: 'Nanc',
                  );
                },
              ),
            ),
          );
        }
        return const ColoredBox(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
