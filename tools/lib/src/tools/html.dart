import 'package:html/dom.dart';
import 'package:html/parser.dart';

Document parseMarkup(String markup) {
  final Document document = parse(markup);
  return document;
}
