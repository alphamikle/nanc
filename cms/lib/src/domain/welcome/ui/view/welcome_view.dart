import 'package:cms/src/domain/tutorial/logic/bloc/tutorial_bloc.dart';
import 'package:cms/src/service/animations/growing_tree.dart';
import 'package:cms/src/service/scenario/episode.dart';
import 'package:cms/src/service/scenario/scenario.dart';
import 'package:cms/src/service/scenario/scenario_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    super.key,
  });

  Scenario introScenario(BuildContext context) {
    final TextStyle? style = context.theme.textTheme.bodyLarge;
    final Color color = context.theme.colorScheme.error;
    final TextStyle? specialStyle = style?.copyWith(color: color, fontWeight: FontWeight.bold);

    return Scenario(
      delayFactory: (Episode? episode) {
        final String? text = episode?.text;

        if (text != null) {
          /// https://shorturl.at/iosQ5
          /// https://shorturl.at/dsBP9
          /// 100 words per minute and 4.7 letters per word = 470 letters per minute
          /// 5 - fixing cf, and 300 - additional time; Also - we don't divide per 1000, lol
          final int readingTime = (470 / 60 * text.length * 5).toInt();
          return Duration(milliseconds: readingTime + 300);
        }

        return Duration(
          milliseconds: randomIntBetween(
            min: 2000,
            max: 4000,
          ),
        );
      },
      episodes: [
        const Episode(text: 'Hello!', delay: Duration(milliseconds: 1000)),
        const Episode(text: 'This is NANC'),
        Episode(
          builder: (BuildContext context) => RichText(
            text: TextSpan(
              style: style,
              children: [
                TextSpan(text: 'N', style: specialStyle),
                const TextSpan(text: 'ot '),
                TextSpan(text: 'A', style: specialStyle),
                const TextSpan(text: ' '),
                TextSpan(text: 'N', style: specialStyle),
                const TextSpan(text: 'ormal '),
                TextSpan(text: 'C', style: specialStyle),
                const TextSpan(text: 'MS'),
              ],
            ),
          ),
        ),
        const Episode(text: 'With NANC you can bring a new life to your old application'),
        const Episode(text: 'or not :('),
        const Episode(text: 'Just a joke :) Of course you can!'),
        const Episode(text: 'Well, this is a demo CMS-side of the NANC, which will help you to meet with itself'),
        const Episode(text: 'If so, this is just a technical preview demo.\nAnd this text is sure to be more motivational by the time it is released 😉'),
        const Episode(text: 'To start intro - press the button'),
        Episode(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: Row(
                children: [
                  KitBigButton(
                    text: 'Start',
                    onPressed: () => context.read<TutorialBloc>().start(),
                  ),
                ],
              ),
            );
          },
        ),
        const Episode(text: 'Or you can wait until the tree will growth'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle? style = context.theme.textTheme.bodyLarge;

    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.height * 0.75,
              width: size.height * 0.75,
              child: const GrowingTree(),
            ),
            Expanded(
              child: Center(
                child: ScenarioPlayer(
                  scenario: introScenario(context),
                  textStyle: style,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
