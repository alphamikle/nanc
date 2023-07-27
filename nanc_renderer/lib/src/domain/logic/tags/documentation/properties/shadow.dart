import '../../tag_description.dart';
import '../arguments/decoration_arguments.dart';
import '../arguments/scalar_arguments.dart';

TagProperty shadowProp({required String name}) => TagProperty(
      name: name,
      arguments: [
        colorArgument(name: 'color'),
        doubleArgument(name: 'blurRadius'),
        doubleArgument(name: 'spreadRadius'),
        doubleArgument(name: 'offsetX'),
        doubleArgument(name: 'offsetY'),
        blurStyleArgument(name: 'blurStyle'),
      ],
      description: 'Can be used multiple times',
      properties: [],
    );
