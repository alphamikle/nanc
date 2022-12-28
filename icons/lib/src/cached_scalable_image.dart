import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';

class CachedScalableImage {
  static final Map<String, ScalableImage> _cache = {};

  static bool haveAsset(String asset) => _cache.containsKey(asset);

  static Future<ScalableImage> create(String asset) async {
    final ScalableImage si = await ScalableImage.fromSIAsset(
      rootBundle,
      asset,
      compact: true,
    );
    _cache[asset] = si;
    return si;
  }

  static ScalableImage get(String asset) {
    return _cache[asset]!;
  }
}
