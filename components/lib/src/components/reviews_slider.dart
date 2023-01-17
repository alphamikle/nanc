import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ReviewsSlider extends StatefulWidget {
  const ReviewsSlider({
    required this.children,
    required this.height,
    super.key,
  });

  final List<Widget> children;
  final double height;

  @override
  State<ReviewsSlider> createState() => _ReviewsSliderState();
}

class _ReviewsSliderState extends State<ReviewsSlider> {
  late final CarouselController controller = CarouselController();
  int activeIndex = 0;

  Widget _itemBuilder(int index) {
    final Widget child = widget.children[index];
    // final int activeIndex = controller.
    return child;
  }

  List<Widget> _buildDots() {
    final List<Widget> dots = [];
    for (int i = 0; i < widget.children.length; i++) {
      final bool isLast = i == widget.children.length - 1;
      final bool isActive = activeIndex == i;

      dots.addAll(
        [
          Stack(
            children: [
              const SizedBox(width: 20, height: 20),
              Positioned.fill(
                child: Center(
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isLast == false) const SizedBox(width: 12),
        ],
      );
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: widget.height,
            enlargeCenterPage: true,
            enlargeFactor: 0.35,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            onPageChanged: (int index, CarouselPageChangedReason reason) => setState(() => activeIndex = index),
          ),
          items: List.generate(widget.children.length, (int index) => _itemBuilder(index)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDots(),
        ),
      ],
    );
  }
}
