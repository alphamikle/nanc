import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:args/args.dart';
import 'package:path/path.dart' as p;
import 'package:tag_converter/tag_converter.dart';

final ArgParser parser = initParser();

const String json = 'json';
const String jsonAbbr = 'j';
const String proto = 'proto';
const String protoAbbr = 'p';
const String input = 'input';
const String inputAbbr = 'i';
const String output = 'output';
const String outputAbbr = 'o';
const String name = 'name';
const String nameAbbr = 'n';
const String help = 'help';
const String helpAbbr = 'h';

const String helpContent = '''
Convert NUI Server Driven XML content to JSON or/and Protobuf

Usage: dart run tag_converter:convert [arguments]
-h, --help                    Print this usage information.

Required options:
-i, --input                   Path to the input file, which should contain XML-like NUI content

-o, --output                  Path to the output dir, which will contain converted files - JSON or Protobuf

-n, --name                    Name of converted file (without extension) - will be produced one or two files with <name>.[json|pb]

Required flags:

At least one of these flags is required, you can put both to produce two files in the same time):

-j, --json                    If persist - converted file will be in JSON format: /<output>/<name>.json

-p, --proto                   If persist - converted file will be in Protobuf format: /<output>/<name>.pb
''';

void main(List<String> arguments) {
  final ArgResults results = parser.parse(arguments);

  if (results[help] == true) {
    pr(helpContent);
    return;
  }

  final String? inputFilePath = results[input]?.toString();
  File? inputFile;

  if (inputFilePath == null) {
    argumentError(
      name: 'Input file path',
      argument: input,
      abbr: inputAbbr,
      example: './test_xml_data_file.html',
    );
  } else {
    inputFile = File(p.join(p.current, inputFilePath));
    if (inputFile.existsSync() == false) {
      throw Exception('Not found input file with path ${inputFile.path}');
    }
  }

  final String? outputDirPath = results[output]?.toString();

  if (outputDirPath == null) {
    argumentError(
      name: 'Output dir path',
      argument: output,
      abbr: outputAbbr,
      example: './server_driven_ui_data',
    );
  }

  final String? outputFileName = results[name]?.toString();

  if (outputFileName == null) {
    argumentError(
      name: 'Output file name',
      argument: name,
      abbr: nameAbbr,
      example: 'main_page_converted',
    );
  }

  final bool toJson = (results[json] as bool?) ?? false;
  final bool toProto = (results[proto] as bool?) ?? false;

  if (toJson == false && toProto == false) {
    throw Exception(
      'You need to provide at least one argument with conversion type: --$json OR --$proto OR -$jsonAbbr OR -$protoAbbr. And you can provide both',
    );
  }

  final String xmlContent = inputFile.readAsStringSync();
  final Directory outputDir = Directory(p.join(p.current, outputDirPath));
  if (outputDir.existsSync() == false) {
    outputDir.createSync(recursive: true);
  }

  if (toJson) {
    final List<TagNode> nodes = TagsConverter.fromXml(xmlContent);
    final File outputJsonFile = File(p.join(outputDir.path, '$outputFileName.json'));
    outputJsonFile.writeAsStringSync(jsonEncode(listOfTagNodesToJson(nodes)));
    pr('JSON output was generated: ${outputJsonFile.path}');
  }

  if (toProto) {
    final File outputProtoFile = File(p.join(outputDir.path, '$outputFileName.pb'));
    final Uint8List? binaryForm = TagsConverter.toBinaryFromXml(xmlContent);
    if (binaryForm == null) {
      throw Exception('Incorrect inout data: $xmlContent');
    }
    outputProtoFile.writeAsBytesSync(binaryForm);
    pr('Protobuf output was generated: ${outputProtoFile.path}');
  }
}

ArgParser initParser() {
  final ArgParser parser = ArgParser();

  parser.addFlag(json, abbr: jsonAbbr);
  parser.addFlag(proto, abbr: protoAbbr);
  parser.addFlag(help, abbr: helpAbbr);
  parser.addOption(input, abbr: inputAbbr);
  parser.addOption(output, abbr: outputAbbr);
  parser.addOption(name, abbr: nameAbbr);

  return parser;
}

Never argumentError({
  required String name,
  required String argument,
  required String abbr,
  required String example,
}) {
  throw Exception('$name required. Please, provide $name with argument: --$argument="$example" OR -$abbr="$example"');
}

void pr(String message) {
  // ignore: avoid_print
  print(message);
}
