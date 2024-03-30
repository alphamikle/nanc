import 'package:flutter/services.dart';

import '../../property_widget.dart';

class SystemOverlayPropertyWidget extends PropertyWidget<SystemUiOverlayStyle> {
  const SystemOverlayPropertyWidget({
    required super.name,
    required super.property,
    super.key,
  });
}
