import '../../tag_description.dart';
import '../arguments/decoration_arguments.dart';
import '../arguments/scalar_arguments.dart';

TagProperty shadowProp(String name) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
        doubleArg('blurRadius'),
        doubleArg('spreadRadius'),
        doubleArg('offsetX'),
        doubleArg('offsetY'),
        blurStyleArg(),
      ],
      description: 'Can be used multiple times',
      properties: [],
    );
