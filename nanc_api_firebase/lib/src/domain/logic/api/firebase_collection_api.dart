import 'package:model/model.dart';
import 'package:nanc_api_firebase/src/domain/logic/api/firebase_api.dart';
import 'package:nanc_config/nanc_config.dart';

class FirebaseCollectionApi implements ICollectionApi {
  FirebaseCollectionApi({
    required FirebaseApi api,
  }) : _api = api;

  final FirebaseApi _api;

  @override
  Future<CollectionResponseDto> fetchPageList(Model model, List<String> subset, QueryField query, ParamsDto params) {
    // TODO: implement fetchPageList
    throw UnimplementedError();
  }
}
