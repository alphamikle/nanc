import '../../tag_description.dart';
import '../../tools/properties_names.dart';
import '../documentation.dart';

TagProperty textStyleProp({String name = textStyle}) {
  return TagProperty(
    name: name,
    arguments: [
      fontArgument(),
      colorArgument(name: 'color'),
      fontSizeArgument(),
      heightArgument(),
      fontWeightArgument(),
      textDecorationArgument(),
      textOverflowArgument(),
      textBaselineArgument(),
    ],
    properties: [],
  );
}

TagProperty strutStyleProp({String name = strutStyle}) {
  return TagProperty(
    name: name,
    arguments: [
      heightArgument(),
      doubleArgument(name: 'leading'),
      doubleArgument(name: 'size'),
      stringArgument(name: 'debugLabel'),
      stringArgument(name: 'font'),
      fontWeightArgument(),
      boolArgument(name: 'forceHeight'),
      stringArgument(name: 'package'),
      fontStyleArgument(),
    ],
    properties: [],
  );
}

TagProperty textHeightBehaviorProp({String name = textHeightBehavior}) {
  return TagProperty(
    name: name,
    arguments: [
      boolArgument(name: 'firstAscent'),
      boolArgument(name: 'lastDescent'),
      textLeadingDistribution(),
    ],
    properties: [],
  );
}
