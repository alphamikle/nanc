import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:animation_debugger/animation_debugger.dart';
import 'package:config/config.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

import '../service/errors/human_exception.dart';
import '../service/init/initializer.dart';
import '../service/routing/routes.dart';

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

  Future<void> showError(HumanException exception) async {
    await doSomethingWhen(action: () {}, condition: () => rootKey.currentContext != null && mounted, interval: const Duration(milliseconds: 250), maxTries: 50);
    if (rootKey.currentContext != null) {
      if (mounted) {
        final ElegantNotification notification = ElegantNotification.error(
          description: Stack(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: Gap.small),
                        child: KitTooltip(
                          text: exception.additionalInfo,
                          child: const Icon(
                            IconPack.flu_chat_help_filled,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: exception.humanMessage,
                      style: context.theme.textTheme.titleMedium?.copyWith(height: 1.5, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          animation: AnimationType.fromBottom,
          width: 330,
          iconSize: 30,
          animationDuration: const Duration(milliseconds: 750),
          notificationPosition: NotificationPosition.bottomLeft,
          toastDuration: const Duration(seconds: Env.isProduction ? 30 : Env.errorDuration),
          closeButton: (VoidCallback onClose) => Padding(
            padding: const EdgeInsets.only(top: Gap.small, right: Gap.small),
            child: Column(
              children: [
                IconButton(
                  onPressed: onClose,
                  color: context.theme.colorScheme.error,
                  icon: const Icon(IconPack.mdi_close),
                ),
              ],
            ),
          ),
        );
        notification.show(rootKey.currentContext!);
      }
    }
  }

  Widget adminBuilder(BuildContext context, Widget child) {
    final double width = context.query.size.width;
    final double height = context.query.size.height;
    const double minWidth = 1024;

    Widget cmsApp = child;
    if (widget.config.adminWrapperBuilder != null) {
      cmsApp = widget.config.adminWrapperBuilder!(context, rootKey, cmsApp);
    }

    if (width < minWidth) {
      final double multiplier = width / minWidth;

      logg('Scale', multiplier);
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
        'kind': 'cms',
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
                  return VRouter(
                    debugShowCheckedModeBanner: false,
                    navigatorKey: rootKey,
                    routes: buildRoutes(context),
                    onPop: (VRedirector vRedirector) async => vRedirector.stopRedirection(),
                    onSystemPop: (VRedirector vRedirector) async => vRedirector.stopRedirection(),
                    builder: AnimationDebugger.builderWrapper(adminBuilder),
                    theme: themeBuilder(context),
                    darkTheme: themeBuilder(context, dark: true),
                    themeMode: ThemeMode.light,
                    buildTransition: (Animation<double> animation, Animation<double> animation2, Widget child) => child,
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
