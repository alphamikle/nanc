import 'dart:async';

import 'package:additions/additions.dart';
import 'package:cms/cms.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_backend/api/page_api_implementation.dart';
import 'package:nanc_backend/api/page_list_api_implementation.dart';
import 'package:nanc_backend/connection_manager/logic/connection_manager_bloc.dart';
import 'package:nanc_backend/connection_manager/ui/view/webrtc_connection_manager_overlay.dart';
import 'package:nanc_backend/models/bullet.dart';
import 'package:nanc_backend/models/developer.dart';
import 'package:nanc_backend/models/feature.dart';
import 'package:nanc_backend/models/image.dart';
import 'package:nanc_backend/models/landing_page.dart';
import 'package:nanc_backend/models/review.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final PackageInfo info = await getAppInfo();
  logg.wrap(info.toPrettyString(), prefix: 'APP INFO');

  final DbService dbService = createDbService();
  final ConnectionManagerBloc connectionManagerBloc = ConnectionManagerBloc(
    peerServiceFactory: PeerServiceFactory(),
  );

  await adminRunner(
    models: [
      bullet,
      developer,
      feature,
      image,
      landingPage,
      review,
    ],
    pageListApi: PageListApiImplementation(
      dbService: dbService,
    ),
    pageApi: PageApiImplementation(
      dbService: dbService,
      connectionManagerBloc: connectionManagerBloc,
    ),
    renderers: [
      carouselSliderRenderer,
    ],
    clickHandlers: [
      snackbarDemoHandler,
      browserLinksEventDemoHandler,
    ],
    wrapperBuilder: (BuildContext context, GlobalKey<NavigatorState> navigatorKey, Widget adminPanel) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<ConnectionManagerBloc>.value(value: connectionManagerBloc),
        ],
        child: Builder(
          builder: (BuildContext context) {
            return WebRTCConnectionManagerOverlay(
              rootNavigatorKey: navigatorKey,
              child: adminPanel,
            );
          },
        ),
      );
    },
  );
}
