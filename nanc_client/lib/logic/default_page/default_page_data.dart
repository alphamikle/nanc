import 'package:nanc_client/logic/default_page/default_page_screen.dart';
import 'package:tools/tools.dart';

Json defaultPageData() => <String, dynamic>{
      "id": "nanc_client_landing_page",
      "header": "Hello!",
      "stand_with_ukraine": "browser:https://war.ukraine.ua/support-ukraine/",
      "p1": "You've reached the home page of the NANC client demo application.",
      "p2": "To be honest, while we (the NANC team) are still thinking about the name, we like NANC the best. By the way, NANC means \"Not A Normal CMS\".",
      "p3":
          "Let's get to the point! NANC is the next-generation CMS, Backend-agnostic. It can integrate with any existing Backend (you don't have to rewrite your own), or, in the future, allow you to use the \"out of the box\" backend (if you are a small startup and have nothing at all - a ready to work backend would be helpful).",
      "p4": "NANC can manage any form of data - any relational data structure is easily reproducible in NANC.",
      "nanc_screenshot_with_fields": "https://i.ibb.co/yPB4cnT/2022-11-18-16-29-43.png",
      "p5": "Interested already? I suggest you to check out the demo at the link below:",
      "p6":
          "What else can NANC do? Well...for example - CodePush for Flutter! To be honest, it's a bit of a clickbait statement, since NANC can't yet provide as flexible options to update the application without publishing to the storages as React Native offers: due to limitations of the Dart language itself, which is used in Flutter. But some things (a lot of them) can be changed on the fly.",
      "screenshot_with_app_preview": "https://i.ibb.co/V91nrZw/2022-11-18-18-02-14.png",
      "p7": "So, now you're interested? If yes, please let me know:",
      "p8":
          "First and foremost, of course, is the UI. You can implement an interface of any complexity. NANC is currently in the early stages of a technical preview and is not commercially available, but this demo is intended to show you what NANC can do.",
      "p9":
          "Describing an interface in Flutter with NANC is even easier than with the Dart language-you have access to a concise HTML-like syntax with which you can express the depth of your design thoughts. And - NANC has some templating features - you have access to the parent context with all your entity data and can create templates and local variables right in your UI code.",
      "screenshot_with_template": "https://i.ibb.co/h2MttCr/template-with-local-data.png",
      "p10":
          "Well, normally a landing page has to sell something and at this point I would have to suggest for the 30th time that you buy a subscription to NANC so that you can finally reduce your time to market by tens, hundreds of times, but I'm not going to do that. Why not?",
      "p11":
          "As I wrote above, NANC is currently in the early stages of a technical preview. That said, it can already be used for production. However, in order to make it really smooth there are a lot of non-technical things to do - start a company, transfer the intellectual property to it and get the billing system up and running so we can start accepting payments. And to make a free version, which would be useful for indie-developers.",
      "p12":
          "Well, thanks for getting to this point! If you're interested in NANC - fill out the short Google Form, it won't take you more than 2 minutes. We're not just looking for clients, we're looking for investors too.",
      "p13":
          "Also, everything you read is done at NANC in 15 minutes (the text itself took me much longer to write, but it took 15 minutes with it!). If you want to try the native Android or iOS app in action - I suggest you choose your device from the links below:",
      "p14": "One last thing - if you do follow the link and experiment with NANC - you can create your own app right in your browser and see the results on your phone screen in real time!",
      "admin_panel_link_button": [
        {
          "title": "Go to admin side",
          "link": "browser:https://admin.nanc.io",
          "background": "#FF33ACB6",
          "icon": "pencilRuler",
          "text_color": "#FFD4F6F9",
        },
        {
          "title": "Google Form",
          "link": "browser:https://forms.gle/QQSRd4y6aeR2g5pR9",
          "background": "#FF7C46B5",
          "icon": "formDropdown",
          "text_color": "#FFE2C6FF",
        }
      ],
      "store_buttons": [
        {
          "link": "browser:https://www.apple.com/app-store/",
          "image": "https://i.ibb.co/0KTcLJ0/apple-store-badge.png",
        },
        {
          "link": "browser:https://play.google.com/",
          "image": "https://i.ibb.co/Fgd4T9Y/google-play-badge.png",
        }
      ],
      "screen": defaultPageScreen(),
    };
