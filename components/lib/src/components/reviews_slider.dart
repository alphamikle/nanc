import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

class ReviewsSlider extends StatefulWidget {
  const ReviewsSlider({
    required this.children,
    required this.height,
    this.sliderDotGap = 0,
    this.dotColor = Colors.white,
    super.key,
  });

  final List<Widget> children;
  final double height;
  final double sliderDotGap;
  final Color dotColor;

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

  void _goToCard(int index) {
    unawaited(controller.animateToPage(index, duration: const Duration(milliseconds: 300) * (activeIndex - index).abs()));
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
                    decoration: BoxDecoration(
                      color: widget.dotColor,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                        width: 0.5,
                        color: isActive ? widget.dotColor : widget.dotColor.withOpacity(0),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    onTap: () => _goToCard(i),
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
        Padding(
          padding: EdgeInsets.only(bottom: widget.sliderDotGap),
          child: CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
              height: widget.height,
              enlargeCenterPage: true,
              enlargeFactor: 0.35,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              onPageChanged: (int index, CarouselPageChangedReason reason) => safeSetState(() => activeIndex = index),
            ),
            items: List.generate(widget.children.length, (int index) => _itemBuilder(index)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDots(),
        ),
      ],
    );
  }
}
