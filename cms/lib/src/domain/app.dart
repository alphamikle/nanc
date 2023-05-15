import 'dart:async';

import 'package:analytics/analytics.dart';
import 'package:animation_debugger/animation_debugger.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

import '../../cms.dart';
import '../service/errors/error_toaster.dart';
import '../service/errors/error_wrapper.dart';
import '../service/init/initializer.dart';

class App extends StatefulWidget {
  const App({
    required this.config,
    required this.errorStreamController,
    super.key,
  });

  final CmsConfig config;
  final StreamController<ErrorWrapper> errorStreamController;

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
  late final StreamSubscription<ErrorWrapper> errorStreamSubscription;

  void showError(ErrorWrapper errorWrapper) {
    BotToast.showCustomNotification(
      toastBuilder: (VoidCallback onClose) => ErrorToaster(errorWrapper: errorWrapper, onClose: onClose),
      duration: const Duration(seconds: 30),
      dismissDirections: [],
    );
  }

  Widget adminBuilder(BuildContext context, Widget child) {
    final double width = context.query.size.width;
    final double height = context.query.size.height;
    const double minWidth = 1024;

    final TransitionBuilder toastBuilder = BotToastInit();
    Widget cmsApp = toastBuilder(context, child);
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
                    navigatorObservers: [
                      BotToastNavigatorObserver(),
                    ],
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
