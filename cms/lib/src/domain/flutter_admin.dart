import 'dart:async';

import 'package:additions/additions.dart';
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
import 'package:model/model.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:vrouter/vrouter.dart';

class FlutterAdmin extends StatefulWidget {
  const FlutterAdmin({
    required this.models,
    required this.pageListApi,
    required this.pageApi,
    required this.config,
    required this.errorStreamController,
    this.wrapperBuilder,
    this.clickHandlers = const [],
    super.key,
  });

  final List<Model> models;
  final PageListApi pageListApi;
  final PageApi pageApi;
  final AdminConfig config;
  final StreamController<ErrorWrapper> errorStreamController;
  final AdminWrapperBuilder? wrapperBuilder;
  final List<RichClickHandler> clickHandlers;

  @override
  State<FlutterAdmin> createState() => _FlutterAdminState();
}

class _FlutterAdminState extends State<FlutterAdmin> {
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
  );
  late final Future<bool> result = initializer.init();
  late final StreamSubscription<ErrorWrapper> errorStreamSubscription;

  void showError(ErrorWrapper errorWrapper) {
    BotToast.showCustomNotification(
      toastBuilder: (VoidCallback onClose) => ErrorToaster(errorWrapper: errorWrapper, onClose: onClose),
      duration: const Duration(minutes: 1),
      dismissDirections: [],
    );
  }

  Widget adminBuilder(BuildContext context, Widget child) {
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
                  return ShowCaseWidget(
                    blurValue: 4,
                    builder: Builder(
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
                          scrollBehavior: AlwaysTouchScrollBehavior(),
                          themeMode: ThemeMode.light,
                          buildTransition: (Animation<double> animation, Animation<double> animation2, Widget child) => child,
                        );
                      },
                    ),
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
