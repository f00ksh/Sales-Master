import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatelessWidget {
  final List<Widget>? children;

  const SliderWidget({
    super.key,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 5,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 170.r,
            child: PageView(
              controller: pageController,
              children: children ?? [],
            ),
          ),
          SizedBox(height: 15.h),
          SmoothPageIndicator(
            controller: pageController,
            count: children?.length ?? 2,
            effect: WormEffect(
              dotColor: Theme.of(context).colorScheme.surfaceVariant,
              activeDotColor: Theme.of(context).colorScheme.primary,
              dotHeight: 8,
              dotWidth: 8,
              type: WormType.thin,
            ),
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
        ],
      ),
    );
  }
}
