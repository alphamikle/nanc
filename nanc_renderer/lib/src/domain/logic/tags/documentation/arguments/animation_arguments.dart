import '../../tag_description.dart';
import '../documentation_types.dart';
import 'scalar_arguments.dart';

TagArgument curveArgument({required String name}) => TagArgument(name, DocumentationTypes.curveEnumValues, '''
Curve is the parameter that determines exactly how the animation will play over time.

You can learn more about Curves from here:
https://api.flutter.dev/flutter/animation/Curves-class.html
''');
TagArgument durationArgument({required String name}) => intArgument(name: name, description: '''
Duration of something in milliseconds. For example, value `1000` will be equal to one second and 60000 to one minute.
''');
