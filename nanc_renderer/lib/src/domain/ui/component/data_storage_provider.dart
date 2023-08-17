import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/tags/logic/data_storage.dart';

class DataStorageProvider extends BlocProvider<DataStorage> {
  const DataStorageProvider({
    required DataStorage dataStorage,
    required super.child,
    super.key,
  }) : super.value(value: dataStorage);
}
