import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagArgument onPressedArg([String name = 'onPressed']) => stringArg(name, '''
> ### Tap handling
>
> At the moment, one way to handle custom presses is to set the event parameters as the value of the `onPressed` argument. You can use anything you want as this value and handle these events any way you want.
>
> For example - there are only a few handlers implemented in this demo:
> * snackbar: <event> - shows the text specified in <event> with the widget `SnackBar`.
> * browser: <event> - allows you to open an external link through the built-in browser / WebView
> * deeplink: <event> - allows to open an internal link of the application, for example - to go to another screen
> *(fow now, demo application doesn't support any different routes or deep-links)*
> * share: <content> - allows to share something, which is places instead of `<content`
>
> In a real, production-ready application, you are not limited to implementing event handlers and can do whatever you want.
> 
> In the nearest future we're going to implement the feature of writing logic of almost any complexity with Dart, right in Nanc (in your browser!), which will allow you to implement any of your ideas, immediately check it in Nanc, and make it available to your users in a moment, without the need to republish the application in AppStore or GooglePlay. And yes! It's possible with Flutter.
''');
