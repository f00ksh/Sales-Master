import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_master/features/product/presentation/viewmodels/allProduct.viewmodel.dart';
import 'package:sales_master/shared/widgets/back_button.dart';
import 'package:sales_master/shared/widgets/confirm_dialog.dart';

class ProductSliverAppBar extends ConsumerWidget {
  const ProductSliverAppBar({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productViewModelProvider(int.parse(id)));

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      leading: const MyBackButton(),
      floating: false,
      snap: false,
      pinned: false,
      expandedHeight: 270.h,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ConfirmationDialog(
                  title: "Confirm Deletion",
                  content: "Are you sure you want to delete this item?",
                  onConfirm: () {
                    ref
                        .read(allProductViewModelProvider.notifier)
                        .deleteProduct(int.parse(id));
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
          icon: Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.delete_outline_rounded,
            ),
          ),
        ),
      ],
      flexibleSpace: product.when(
        data: (product) {
          return FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.fadeTitle
            ],
            background:
                // product.imagePath!.isEmpty
                //     ? Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             SizedBox(
                //               height: 20.h,
                //             ),
                //             Icon(
                //               UniconsLine.package,
                //               size: 100.h,
                //             )
                //           ],
                //         ),
                //       )
                // :
                Stack(
              children: [
                Positioned.fill(
                  child: Image(
                    image: FileImage(File(product.imagePath!)),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -4,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return const SizedBox.shrink();
        },
        loading: () {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
