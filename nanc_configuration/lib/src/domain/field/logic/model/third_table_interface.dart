import 'package:nanc_tools/nanc_tools.dart';

import '../../../model/logic/model/model_interface.dart';

abstract interface class IThirdTable {
  abstract final IModel relationsEntity;
  abstract final String parentEntityIdName;
  abstract final String childEntityIdName;

  Json toJson();

  List<Object?> get props;
}
