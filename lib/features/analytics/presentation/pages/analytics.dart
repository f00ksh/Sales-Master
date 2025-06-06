import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ms_undraw/ms_undraw.dart';

class AnalyticsPage extends StatelessWidget {
  static const String route = '/analytics';
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 150.h,
                horizontal: 50.w,
              ),
              child: SizedBox(
                height: 200.h,
                width: 200.w,
                child: UnDraw(
                  color: Theme.of(context).colorScheme.primary,
                  illustration: UnDrawIllustration.pie_graph,
                  placeholder: const SizedBox.shrink(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
