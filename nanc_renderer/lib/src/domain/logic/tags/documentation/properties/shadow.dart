import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/decoration_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

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
