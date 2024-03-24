abstract class Params {
  static const Param pageId = Param('pageId');
  static const Param modelId = Param('modelId');
}

class Param {
  const Param(this.name);

  final String name;

  String get param => ':$name';
}
