import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation_types.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagArgument curveArg([String name = 'curve']) => TagArgument(name, DocumentationTypes.curveEnumValues, '''
Curve is the parameter that determines exactly how the animation will play over time.

You can learn more about Curves from here:
https://api.flutter.dev/flutter/animation/Curves-class.html
''');
TagArgument durationArg([String name = 'duration']) => intArg(name, '''
Duration of something in milliseconds. For example, value `1000` will be equal to one second and 60000 to one minute.
''');
