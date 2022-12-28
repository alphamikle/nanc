import 'package:flutter/material.dart';
import 'package:nanc_backend/connection_manager/logic/model/client.dart';

const double _kSize = 20;

class ClientStatusIndicator extends StatelessWidget {
  const ClientStatusIndicator({
    required this.status,
    super.key,
  });

  final ClientStatus status;

  Color generateColor() {
    if (status == ClientStatus.disconnected) {
      return const Color.fromRGBO(255, 179, 2, 1);
    } else if (status == ClientStatus.connected) {
      return const Color.fromRGBO(86, 240, 0, 1);
    } else if (status == ClientStatus.connecting) {
      return const Color.fromRGBO(45, 204, 255, 1);
    }
    return const Color.fromRGBO(158, 167, 173, 1);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: _kSize,
      height: _kSize,
      decoration: BoxDecoration(
        color: generateColor(),
        borderRadius: const BorderRadius.all(Radius.circular(_kSize)),
      ),
    );
  }
}
