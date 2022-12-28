import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanc_client/logic/bloc/page_state.dart';
import 'package:nanc_client/logic/default_page/default_page_data.dart';
import 'package:nanc_client/logic/webrtc_client_service.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

final log = logg('PAGE BLOC');

class PageBloc extends Cubit<PageState> {
  PageBloc({
    required this.clientService,
    required this.rootKey,
  }) : super(PageState.empty());

  final WebRTCClientService clientService;
  final TextEditingController roomIdController = TextEditingController();
  final RootKey rootKey;

  final Set<String> _usedConnectionIds = {};

  Future<void> connectToBackend() async {
    emit(state.copyWith(isConnectingToTheBackend: true));
    final String roomId = await decrypt(roomIdController.text);
    await clientService.connectToBackend(roomId);
    clientService.connectionService.registerMessageHandler(messageType: kUpdatePage, handler: _pagesUpdatesHandler);
    _usedConnectionIds.add(roomId);
    emit(state.copyWith(
      isConnectingToTheBackend: false,
      isConnectedToTheBackend: true,
    ));
    roomIdController.clear();
  }

  String? validateRoomId() {
    final String roomId = decryptSync(roomIdController.text);
    if (_usedConnectionIds.contains(roomId)) {
      return 'Connection expired';
    }
    return null;
  }

  Future<void> disconnect() async {
    clientService.connectionService.removeMessageHandler(kUpdatePage);
    await clientService.disconnect();
    emit(state.copyWith(
      isConnectedToTheBackend: false,
      isConnectingToTheBackend: false,
      isLoading: false,
    ));
  }

  Future<void> preload(String url) async {
    emit(state.copyWith(isLoading: true));
    if (url == '/') {
      emit(state.copyWith(
        pageData: defaultPageData(),
      ));
    }

    logg('''
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
PRELOADING PAGE
url: $url
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
''');
    emit(state.copyWith(isLoading: false));
  }

  Future<Message?> _pagesUpdatesHandler(Message message) async {
    logg('Client got a new message from the host: $message');
    if (message.payload is Json) {
      final Json payload = message.payload as Json;
      final String? modelId = payload[kModelId] as String?;
      final Json? pageData = payload[kPageData] as Json?;
      if (modelId != null && pageData != null) {
        unawaited(_handleNewPageData(modelId: modelId, pageData: pageData));
      }
    }
    return null;
  }

  Future<void> _handleNewPageData({required String modelId, required Json pageData}) async {
    logg('Handle new page data; ModelId: $modelId, PageData: $pageData');
    final bool needToUpdateView = await confirmAction(
      context: rootKey.currentContext!,
      title: 'Reload current view?',
      subtitle: 'The content was updated on the CMS side. Do you want to see it?',
      wrapper: (BuildContext context, Widget child) => Padding(
        padding: const EdgeInsets.only(left: Gap.large, right: Gap.large),
        child: child,
      ),
    );
    if (needToUpdateView) {
      emit(state.copyWith(
        pageData: pageData,
      ));
    }
  }
}
