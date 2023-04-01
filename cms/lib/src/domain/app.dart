import 'dart:async';

import 'package:additions/additions.dart';
import 'package:analytics/analytics.dart';
import 'package:animation_debugger/animation_debugger.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms/cms.dart';
import 'package:cms/src/domain/wrapper/admin_wrapper.dart';
import 'package:cms/src/service/code_style/code_style.dart';
import 'package:cms/src/service/config/admin_config.dart';
import 'package:cms/src/service/errors/error_toaster.dart';
import 'package:cms/src/service/errors/error_wrapper.dart';
import 'package:cms/src/service/init/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:model/model.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

class App extends StatefulWidget {
  const App({
    required this.models,
    required this.pageListApi,
    required this.pageApi,
    required this.config,
    required this.errorStreamController,
    this.wrapperBuilder,
    this.clickHandlers = const [],
    this.renderers = const [],
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
    this.imageFrameBuilder,
    this.customFonts = const [],
    super.key,
  });

  final List<Model> models;
  final PageListApi pageListApi;
  final PageApi pageApi;
  final AdminConfig config;
  final StreamController<ErrorWrapper> errorStreamController;
  final AdminWrapperBuilder? wrapperBuilder;
  final List<RichClickHandler> clickHandlers;
  final List<TagRenderer> renderers;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
  final List<CustomFont> customFonts;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> rootKey = GlobalKey();
  late final Initializer initializer = Initializer(
    models: widget.models,
    pageListApi: widget.pageListApi,
    pageApi: widget.pageApi,
    config: widget.config,
    rootKey: rootKey,
    patternMap: CodeStyle(rootKey: rootKey).patternMap,
    errorStreamController: widget.errorStreamController,
    clickHandlers: widget.clickHandlers,
    renderers: widget.renderers,
    imageLoadingBuilder: widget.imageLoadingBuilder,
    imageErrorBuilder: widget.imageErrorBuilder,
    imageFrameBuilder: widget.imageFrameBuilder,
    customFonts: widget.customFonts,
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
    const double minWidth = 1024;

    if (width < minWidth) {
      return Material(
        color: context.theme.colorScheme.surface,
        child: Center(
          child: Text(
            'The screen width is too small - ${width.toInt()}px\nNanc supporting only ${minWidth.toInt()}px+ width for now',
            textAlign: TextAlign.center,
            style: context.theme.textTheme.headlineMedium,
          ),
        ),
      );
    }

    final TransitionBuilder toastBuilder = BotToastInit();
    final Widget toastContainer = toastBuilder(context, child);
    if (widget.wrapperBuilder == null) {
      return toastContainer;
    }
    final Widget wrapperContainer = widget.wrapperBuilder!(context, rootKey, toastContainer);
    return wrapperContainer;
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
