import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_client/logic/bloc/page_bloc.dart';
import 'package:nanc_client/logic/webrtc_client_service.dart';
import 'package:nanc_client/nanc_app.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final PackageInfo info = await getAppInfo();
  logg.wrap(info.toPrettyString(), prefix: 'APP INFO');

  final DbService dbService = createDbService();
  await Supabase.initialize(url: kSupaHost, anonKey: kSupaKey);
  await SupabaseAuth.initialize();
  final CloudDb cloudDb = createCloudDb(dbService);
  // ignore: close_sinks
  final StreamController<String> webRTCServiceDisposeStreamController = StreamController.broadcast();

  void onDispose(String serviceId) {
    webRTCServiceDisposeStreamController.add(serviceId);
  }

  final WebRTCServiceFactory webRTCServiceFactory = WebRTCServiceFactory(
    dbProvider: cloudDb,
    onDispose: onDispose,
  );
  final RootKey rootKey = GlobalKey();
  final WebRTCClientService clientService = WebRTCClientService(webRTCServiceFactory: webRTCServiceFactory);
  final PageBloc pageBloc = PageBloc(clientService: clientService, rootKey: rootKey);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WebRTCServiceFactory>.value(value: webRTCServiceFactory),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PageBloc>.value(value: pageBloc),
        ],
        child: NancApp(rootKey: rootKey),
      ),
    ),
  );
}
