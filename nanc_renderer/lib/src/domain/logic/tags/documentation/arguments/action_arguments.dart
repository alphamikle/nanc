import '../../tag_description.dart';
import 'scalar_arguments.dart';

TagArgument eventArgument({required String name}) => stringArgument(name: name, description: '''
> ### Events handling
>
> You can use anything you want as this value and handle these events any way you want.
>
> For example - there are only a few handlers implemented in this demo:
> * snackbar: <event> - shows the text specified in <event> with the widget `SnackBar`.
> * browser: <event> - allows you to open an external link through the built-in browser / WebView
> * deeplink: <event> - allows to open an internal link of the application, for example - to go to another screen
> *(fow now, demo application doesn't support any different routes or deep-links)*
> * share: <content> - allows to share something, which is places instead of `<content`
>
> In a real, production-ready application, you are not limited to implementing event handlers and can do whatever you want.''');
