import 'package:flutter/material.dart';
import 'package:rich_renderer/src/logic/click_delegate.dart';

VoidCallback? handleClick(BuildContext context, String? event) {
  if (event == null) {
    return null;
  }
  // ignore: discarded_futures
  return () => ClickDelegate.of(context).onPressed(event);
}

/// TODO(alphamikle): Создать глобальный класс, оборачивающий все эти виджеты, и в нем хранить данные
/// При нахождении <data> тега - из него записывать данные в этот глобальный класс-хранилище
