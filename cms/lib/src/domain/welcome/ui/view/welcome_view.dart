import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../service/animations/growing_tree.dart';
import '../../../../service/scenario/episode.dart';
import '../../../../service/scenario/scenario.dart';
import '../../../../service/scenario/scenario_player.dart';

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
        const Episode(text: 'Well, this is a demo Nanc-CMS application, which will help you to meet with itself'),
        const Episode(text: 'If so, this is just a technical preview demo.\nAnd this text is sure to be more motivational by the time it is released 😉'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = context.theme.textTheme.bodyLarge;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(
            flex: 2,
            child: RepaintBoundary(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GrowingTree(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: RepaintBoundary(
                child: ScenarioPlayer(
                  scenario: introScenario(context),
                  textStyle: style,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
