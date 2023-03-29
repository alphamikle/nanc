import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renderer/src/domain/logic/renderers/property/property_widget.dart';

typedef TagRendererFactory = FutureOr<TagRenderer> Function();
typedef PropertyWidgetFactory = FutureOr<PropertyWidget<Object?>> Function();
