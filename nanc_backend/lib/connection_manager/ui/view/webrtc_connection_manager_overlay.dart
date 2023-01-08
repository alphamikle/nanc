import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:nanc_backend/connection_manager/logic/connection_manager_bloc.dart';
import 'package:nanc_backend/connection_manager/ui/components/webrtc_connection_manager_modal.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class WebRTCConnectionManagerOverlay extends StatefulWidget {
  const WebRTCConnectionManagerOverlay({
    required this.rootNavigatorKey,
    required this.child,
    super.key,
  });

  final GlobalKey<NavigatorState> rootNavigatorKey;
  final Widget child;

  @override
  State<WebRTCConnectionManagerOverlay> createState() => _WebRTCConnectionManagerOverlayState();
}

class _WebRTCConnectionManagerOverlayState extends State<WebRTCConnectionManagerOverlay> {
  bool isModalVisible = false;

  NavigatorState get rootNavigatorState => widget.rootNavigatorKey.currentState!;

  BuildContext get rootNavigatorContext => widget.rootNavigatorKey.currentContext!;

  Future<void> showConnectionModal() async {
    setState(() => isModalVisible = true);
    final ConnectionManagerBloc connectionManagerBloc = context.read();
    // final UserBloc userBloc = context.read();
    // bool? authStatus;
    // if (userBloc.state.isAuthorized == false) {
    //   authStatus = await showDialog<bool>(
    //     context: rootNavigatorContext,
    //     builder: (BuildContext context) => BlocProvider.value(
    //       value: userBloc,
    //       child: const UserAuthModal(),
    //     ),
    //   );
    // } else {
    //   authStatus = true;
    // }
    //
    // if (authStatus ?? false || true) {
    // }
    await showDialog<void>(
      barrierDismissible: false,
      context: rootNavigatorContext,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: connectionManagerBloc,
          child: WebRTCConnectionManagerModal(
            onClose: () => rootNavigatorState.pop(),
          ),
        );
      },
    );
    setState(() => isModalVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (BuildContext context) {
            return Scaffold(
              body: widget.child,
              floatingActionButton: AnimatedOpacity(
                curve: Curves.easeInQuart,
                duration: const Duration(milliseconds: 250),
                opacity: isModalVisible ? 0 : 1,
                child: AbsorbPointer(
                  absorbing: isModalVisible,
                  child: KitTooltip(
                    text: 'Connect client app',
                    child: FloatingActionButton(
                      backgroundColor: context.theme.colorScheme.tertiary,
                      onPressed: showConnectionModal,
                      child: Icon(
                        IconPack.flu_scan_qr_code_filled,
                        color: context.theme.colorScheme.onTertiary,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
