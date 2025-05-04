import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productPublicPrice,
    required this.totalPrice,
  });

  final Widget thumbnail;
  final String productName;
  final String productPrice;
  final String productPublicPrice;
  final String productQuantity;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    final tertiaryContainer = Theme.of(context).colorScheme.tertiaryContainer;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(.6),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(5),
        height: 70.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      productPrice,
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${totalPrice.toString()} \$',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 18.sp),
                ),
                Row(
                  mainAxisSize: MainAxisSize
                      .min, // Ensure that the row takes minimum space
                  children: [
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: tertiaryContainer,
                        ),
                        child: const Icon(Icons.remove),
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      productQuantity,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 18.sp),
                    ),
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: tertiaryContainer,
                        ),
                        child: const Icon(Icons.add),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
