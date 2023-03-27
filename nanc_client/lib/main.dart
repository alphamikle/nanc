import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:nanc_client/logic/bloc/page_bloc.dart';
import 'package:nanc_client/logic/peer_client_service.dart';
import 'package:nanc_client/nanc_app.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final PackageInfo info = await getAppInfo();
  [
    const CustomFont(font: 'Blazeface'),
    const CustomFont(font: 'Helvetica'),
  ].forEach(registerCustomFont);

  logg.wrap(info.toPrettyString(), prefix: 'APP INFO');

  final RootKey rootKey = GlobalKey();
  final PeerClientService peerClientService = PeerClientService(peerServiceFactory: PeerServiceFactory());
  final PageBloc pageBloc = PageBloc(peerClientService: peerClientService, rootKey: rootKey);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PeerServiceFactory>.value(value: PeerServiceFactory()),
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
