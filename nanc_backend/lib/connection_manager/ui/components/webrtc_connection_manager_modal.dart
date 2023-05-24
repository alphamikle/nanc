import 'dart:async';
import 'dart:math';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../logic/connection_manager_bloc.dart';
import '../../logic/connection_manager_state.dart';
import '../../logic/model/client.dart';
import 'client_status_indicator.dart';

const double _kMenuWidth = 250;

class WebRTCConnectionManagerModal extends StatefulWidget {
  const WebRTCConnectionManagerModal({
    required this.onClose,
    super.key,
  });

  final VoidCallback onClose;

  @override
  State<WebRTCConnectionManagerModal> createState() => _WebRTCConnectionManagerModalState();
}

class _WebRTCConnectionManagerModalState extends State<WebRTCConnectionManagerModal> with SingleTickerProviderStateMixin, AnimatedState {
  @override
  Curve get animationCurve => Curves.easeInQuart;

  @override
  Duration get animationDuration => const Duration(milliseconds: 500);

  ConnectionManagerBloc get connectionManagerBloc => context.read();

  void notifyAboutConnectedClient() {
    if (mounted) {
      showMessageNotification(context, '''
Client successfully connected!
Now, you can move to the Solo → Landing Page → Screen
And play with the client app UI
''');
    }
  }

  Future<void> preload() async {
    if (connectionManagerBloc.state.isEmptyId && connectionManagerBloc.state.hasAnyClient == false) {
      await connectionManagerBloc.createConnection(onClientConnected: notifyAboutConnectedClient);
    }
    if (connectionManagerBloc.state.hasAnyClient) {
      await openMenu();
    }
  }

  Future<void> openMenu() async => animationController.forward();

  Future<void> closeMenu() async => animationController.animateBack(0);

  Widget itemBuilder(BuildContext context, int index) {
    final Client client = connectionManagerBloc.state.clients[index];

    return ListTile(
      onTap: () {},
      minVerticalPadding: 0,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClientStatusIndicator(status: client.status),
          ),
          Expanded(
            child: Text(
              client.roomId,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double size = min(screenSize.width, screenSize.height) * 0.5;

    return KitModal(
      onClose: widget.onClose,
      header: const Text('Connection manager'),
      child: BlocConsumer<ConnectionManagerBloc, ConnectionManagerState>(
        listener: (BuildContext context, ConnectionManagerState state) async => state.clients.isEmpty ? closeMenu() : openMenu(),
        builder: (BuildContext context, ConnectionManagerState state) {
          return state.isLoading && state.hasAnyClient == false
              ? const KitPreloader()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// ? CLIENTS MENU
                    BlocBuilder<ConnectionManagerBloc, ConnectionManagerState>(
                      builder: (BuildContext context, ConnectionManagerState state) {
                        return AnimatedBuilder(
                          animation: animation,
                          builder: (BuildContext context, Widget? child) {
                            return Container(
                              decoration: BoxDecoration(
                                color: context.theme.colorScheme.tertiaryContainer.withOpacity(animation.value / 2),
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(16)),
                              ),
                              width: animation.value * _kMenuWidth,
                              child: Opacity(
                                opacity: animation.value,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// ? MENU TITLE
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16, top: 20, bottom: 12),
                                      child: Text(
                                        'Clients',
                                        style:
                                            context.theme.textTheme.titleLarge?.copyWith(color: context.theme.textTheme.titleLarge?.color?.withOpacity(0.65)),
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),

                                    /// ? MENU ITEMS
                                    Expanded(
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemBuilder: itemBuilder,
                                          itemCount: state.clients.length,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),

                    /// ? BLOCK WITH QR-CODE OR BUTTON OR PRELOADER
                    Expanded(
                      child: BlocBuilder<ConnectionManagerBloc, ConnectionManagerState>(
                        builder: (BuildContext context, ConnectionManagerState state) {
                          return Stack(
                            children: [
                              /// ? NEW CLIENT GENERATION PRELOADER
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 250),
                                opacity: state.isLoading ? 1 : 0,
                                child: const KitPreloader(),
                              ),

                              /// ? QR-CODE BLOCK
                              Center(
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 250),
                                  opacity: state.isEmptyId ? 0 : 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      /// ? CODE TITLE
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          bottom: 24,
                                        ),
                                        child: SizedBox(
                                          width: size,
                                          child: Text(
                                            'Scan it from the client app\nor press on it to copy to buffer',
                                            style: context.theme.textTheme.headlineSmall,
                                          ),
                                        ),
                                      ),

                                      /// ? QR-CODE
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 32),
                                        child: KitInkWell(
                                          onPressed: state.isEmptyId
                                              ? null
                                              : () async {
                                                  await copyTextToClipboard(state.freshRoomId);
                                                  if (mounted) {
                                                    showMessageNotification(context, 'Connection data successfully copied');
                                                  }
                                                },
                                          child: AnimatedSwitcher(
                                            duration: const Duration(milliseconds: 250),
                                            child: PrettyQr(
                                              key: ValueKey(state.freshRoomId),
                                              elementColor: context.theme.colorScheme.primary,
                                              roundEdges: true,
                                              errorCorrectLevel: QrErrorCorrectLevel.Q,
                                              data: state.freshRoomId,
                                              size: size,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /// ? NEW CLIENT BUTTON
                              Center(
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 250),
                                  opacity: state.isEmptyId && state.isLoading == false ? 1 : 0,
                                  child: IgnorePointer(
                                    ignoring: state.isNotEmptyId,
                                    child: KitBigButton(
                                      onPressed: state.isNotEmptyId
                                          ? null
                                          : () async => connectionManagerBloc.createConnection(
                                                onClientConnected: notifyAboutConnectedClient,
                                              ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 16),
                                            child: Icon(
                                              IconPack.mdi_qrcode,
                                              size: 24,
                                            ),
                                          ),
                                          Text('Add new client'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
