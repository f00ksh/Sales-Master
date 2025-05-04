import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllClientsSliverAppbar extends StatelessWidget {
  const AllClientsSliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      sliver: SliverAppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        floating: true,
        snap: true,
        expandedHeight: 49.h,
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SearchBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
              constraints: BoxConstraints.tight(
                const Size(double.infinity, 50),
              ),
              shadowColor: const MaterialStatePropertyAll(Colors.transparent),
              hintText: 'Search for Clients...',
              elevation: const MaterialStatePropertyAll(3),
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 9.w),
              ),
              trailing: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
