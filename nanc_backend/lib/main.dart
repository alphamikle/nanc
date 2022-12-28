import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_backend/api/page_api_implementation.dart';
import 'package:nanc_backend/api/page_list_api_implementation.dart';
import 'package:nanc_backend/connection_manager/logic/connection_manager_bloc.dart';
import 'package:nanc_backend/connection_manager/ui/view/webrtc_connection_manager_overlay.dart';
import 'package:nanc_backend/models/article.dart';
import 'package:nanc_backend/models/bullet.dart';
import 'package:nanc_backend/models/developer.dart';
import 'package:nanc_backend/models/feature.dart';
import 'package:nanc_backend/models/image.dart';
import 'package:nanc_backend/models/landing_page.dart';
import 'package:nanc_backend/models/page_review_relations.dart';
import 'package:nanc_backend/models/review.dart';
import 'package:nanc_backend/user/logic/bloc/user_bloc.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DbService dbService = createDbService();
  await Supabase.initialize(url: kSupaHost, anonKey: kSupaKey);
  await SupabaseAuth.initialize();
  final CloudDb cloudDb = createCloudDb(dbService);
  // ignore: close_sinks
  final StreamController<String> webRTCServiceDisposeStreamController = StreamController.broadcast();

  void onDispose(String serviceId) {
    webRTCServiceDisposeStreamController.add(serviceId);
  }

  final WebRTCServiceFactory webRTCServiceFactory = WebRTCServiceFactory(dbProvider: cloudDb, onDispose: onDispose);
  final ConnectionManagerBloc connectionManagerBloc = ConnectionManagerBloc(
    webRTCServiceFactory: webRTCServiceFactory,
    webRTCServiceDisposeStream: webRTCServiceDisposeStreamController.stream,
  );
  final UserBloc userBloc = UserBloc(cloudDb: cloudDb);

  await adminRunner(
    models: [
      article,
      bullet,
      developer,
      feature,
      image,
      landingPage,
      pageReviewRelations,
      review,
    ],
    pageListApi: PageListApiImplementation(
      dbService: dbService,
    ),
    pageApi: PageApiImplementation(
      dbService: dbService,
      connectionManagerBloc: connectionManagerBloc,
    ),
    wrapperBuilder: (BuildContext context, GlobalKey<NavigatorState> navigatorKey, Widget adminPanel) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<ConnectionManagerBloc>.value(value: connectionManagerBloc),
          BlocProvider<UserBloc>.value(value: userBloc),
        ],
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<WebRTCServiceFactory>.value(value: webRTCServiceFactory),
            RepositoryProvider<CloudDb>.value(value: cloudDb),
          ],
          child: Builder(
            builder: (BuildContext context) {
              return WebRTCConnectionManagerOverlay(
                rootNavigatorKey: navigatorKey,
                child: adminPanel,
              );
            },
          ),
        ),
      );
    },
  );
}
