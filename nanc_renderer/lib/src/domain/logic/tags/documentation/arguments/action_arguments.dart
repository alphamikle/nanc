import '../../tag_description.dart';
import 'scalar_arguments.dart';

TagArgument eventArgument({
  required String name,
  String? metaName,
  String? metaValue,
}) =>
    stringArgument(name: name, description: '''
> ### Events handling
>
> You can use anything you want as this value and handle these events any way you want.
>
> For example - there are only a few handlers implemented in this demo:
> * snackbar: <event> - shows the text specified in <event> with the widget `SnackBar`.
> * browser: <event> - allows you to open an external link through the built-in browser / WebView
> * deeplink: <event> - allows to open an internal link of the application, for example - to go to another screen
> * share: <content> - allows to share something, which is places instead of `<content`
>
> In a real, production-ready application, you are not limited to implementing event handlers and can do whatever you want.${_generateMetaInfo(metaName, metaValue)}''');

String _generateMetaInfo(String? metaName, String? metaValue) {
  if ((metaName?.isNotEmpty ?? false) && (metaValue?.isNotEmpty ?? false)) {
    return '\n\n\n> This event will send you additional metadata with `key=\'$metaName\'` and the `value=$metaValue`';
  }
  return '';
}
