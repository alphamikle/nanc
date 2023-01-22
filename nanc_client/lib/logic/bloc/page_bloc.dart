import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanc_client/logic/bloc/page_state.dart';
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

  Future<Json> preloadDefaultPageData() async {
    try {
      final Dio dio = Dio();
      final Response<String> json = await dio.get<String>('https://raw.githubusercontent.com/alphamikle/client.nanc.io/master/page_data.json');
      Json? page;

      /// ? We will parse JSON String now
      if (json.data != null && json.data is String) {
        final dynamic result = jsonDecode(json.data!);
        if (result is List && result.isNotEmpty) {
          page = castToJson(result.first);
        }
      }
      if (page == null) {
        return <String, dynamic>{
          'screen': {
            "content": '''
<safeArea>
  <text size="30" align="center">
    NOT FOUND\nANY CONTENT\n\n😭😭😭
  </text>
</safeArea>
''',
            'contentType': 'scrollable',
            'fieldType': "screenContent"
          },
        };
      }
      return page;
    } catch (error) {
      return <String, dynamic>{
        'screen': {
          "content": '''
<safeArea>
  <text size="30" align="center">
    WE GETTING AN ERROR ON LOADING CONTENT
    $error
  </text>
</safeArea>
''',
          'contentType': 'scrollable',
          'fieldType': "screenContent"
        },
      };
    }
  }

  Future<void> preload(String url) async {
    emit(state.copyWith(isLoading: true));
    if (url == '/') {
      emit(state.copyWith(
        pageData: await preloadDefaultPageData(),
      ));
    }
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
    final bool needToUpdateView = state.alwaysUpdate ||
        await confirmAction(
          context: rootKey.currentContext!,
          title: '',
          subtitle: '',
          wrapper: (BuildContext context, Widget child) {
            return Center(
              child: KitBaseModal(
                width: 600,
                header: Padding(
                  padding: const EdgeInsets.only(bottom: Gap.large),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reload current view?',
                        style: context.theme.textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                body: const Padding(
                  padding: EdgeInsets.only(top: Gap.regular, bottom: Gap.regular),
                  child: Text('The content was updated on the CMS side. Do you want to see it?'),
                ),
                bottom: Row(
                  children: [
                    KitButton(
                      text: 'Ok',
                      color: context.kitColors.successColor,
                      onPressed: () => context.navigator.pop(true),
                    ),
                    KitDivider.horizontal(Gap.large),
                    KitButton(
                      text: 'Always',
                      color: context.kitColors.successColor,
                      onPressed: () {
                        context.navigator.pop(true);
                        emit(state.copyWith(alwaysUpdate: true));
                      },
                    ),
                    KitDivider.horizontal(Gap.large),
                    KitButton(
                      text: 'No',
                      color: context.kitColors.successColor,
                      onPressed: () => context.navigator.pop(false),
                    ),
                  ],
                ),
              ),
            );
          },
        );
    if (needToUpdateView) {
      emit(state.copyWith(
        pageData: pageData,
      ));
    }
  }
}
