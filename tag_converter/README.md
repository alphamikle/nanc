# Tag converter

This package is designed to convert NUI-XML code to JSON and/or Protobuf format. This can be useful for reducing the size of the message being passed, faster rendering and possible unification. In addition, you can use, for example, the resulting JSON to generate similar interfaces using the backend immediately in JSON format, knowing its structure.

The most optimized form of NUI, in turn, is Protobuf, which provides much faster rendering speed in a mobile application. However, this does not mean that the standard way of rendering from XML is slow. No. It's just that Protobuf is much faster.

`tag_converter` depends only on Dart, which makes it easy to run on the server, embedding it in your call processing chains.

To learn all the features of `tag_converter` install this package as a dependency in your project, and run the command:

```bash
dart run tag_converter:convert --help # for help
# or
dart run tag_converter:convert --input ./path_to_some_file_with_nui_xml.html \
      --output ./path_to_output_folder \
      --name output_file_name \
      --proto \
      --json
```

Or, just run the script:

```bash
dart ./tag_converter/bin/convert.dart --help
```