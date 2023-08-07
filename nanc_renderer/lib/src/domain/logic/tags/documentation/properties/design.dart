import '../../../../../../nanc_renderer.dart';

TagProperty systemOverlayProp({required String name}) {
  return TagProperty(
    name: name,
    arguments: [
      brightnessArgument(name: 'statusBarBrightness'),
      colorArgument(name: 'statusBarColor'),
      brightnessArgument(name: 'statusBarIconBrightness'),
      colorArgument(name: 'systemNavigationBarColor'),
      boolArgument(name: 'systemNavigationBarContrastEnforced'),
      colorArgument(name: 'systemNavigationBarDividerColor'),
      brightnessArgument(name: 'systemNavigationBarIconBrightness'),
      boolArgument(name: 'systemStatusBarContrastEnforced'),
    ],
    properties: [],
  );
}
