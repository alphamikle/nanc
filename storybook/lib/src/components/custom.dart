import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:storybook/src/tools/components_group.dart';
import 'package:storybook/src/tools/usecase_factory.dart';

class _Card extends StatelessWidget {
  const _Card({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 20,
              spreadRadius: -10,
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
              Text('ANN LUBIN #$index'),
              const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text('CO_FOUNDER'),
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra nunc ante velit vitae. Est tellus vitae, nullam lobortis enim.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ComponentsGroup custom() => ComponentsGroup(
      groupName: 'Custom',
      components: (UseCaseFactory factory) {
        factory.describeBuilder(
          component: '$ReviewsSlider',
          builder: (BuildContext context) {
            return Center(
              child: ReviewsSlider(
                height: 300,
                children: List.generate(5, (int index) => _Card(index: index)),
              ),
            );
          },
        );
      },
    );
