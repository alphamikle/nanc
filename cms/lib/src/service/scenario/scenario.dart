import 'package:cms/src/service/scenario/episode.dart';

typedef DurationFactory = Duration Function(Episode? episode);

class Scenario {
  const Scenario({
    required this.episodes,
    required this.delayFactory,
  });

  final List<Episode> episodes;
  final DurationFactory delayFactory;
}
