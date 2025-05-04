import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final int colorValue;

  final Widget route;
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
    required this.colorValue,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
        color: isDark
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onPrimaryContainer);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
      borderRadius: BorderRadius.circular(22),
      child: Card(
        elevation: 0,
        color: Color(colorValue).withOpacity(.8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child: SizedBox(
          height: 120.h,
          width: 140.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Badge(
                label: const Text('100'),
                child: Container(
                  width: 80.r,
                  height: 80.r,
                  decoration: BoxDecoration(
                    color: Color(colorValue).withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: FaIcon(
                      icon,
                      size: 40.r,
                      color: isDark
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer
                              .withOpacity(.9),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                title,
                style: textStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
