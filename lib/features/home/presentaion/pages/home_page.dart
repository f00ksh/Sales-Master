import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sales_master/features/cart/presentation/pages/cart_page.dart';
import 'package:sales_master/features/home/presentaion/widgets/grid.widget.dart';
import 'package:sales_master/features/home/presentaion/widgets/recent_order.widget.dart';
import 'package:sales_master/features/home/presentaion/widgets/text.widgets.dart';
import 'package:sales_master/features/home/presentaion/widgets/user_bar.widget.dart';
import 'package:sales_master/features/notification/presentation/pages/notification_page.dart';
import 'package:sales_master/features/setting/presentation/pages/setting_page.dart';
import 'package:sales_master/features/slidercard/presentation/widgets/slider_card.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationPage(),
              ),
            );
          },
          icon: const FaIcon(
            FontAwesomeIcons.bell,
            size: 25,
          ),
        ),
        actions: [
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              );
            },
            icon: const FaIcon(
              FontAwesomeIcons.gear,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.h),
            const UserBar(),
            const SizedBox(height: 5),
            const SliderCardWidget(),
            SizedBox(height: 5.h),
            const GridWidget(),
            SizedBox(height: 10.h),
            const RecentOrderText(),
            SizedBox(height: 5.h),
            const RecentOrder(),
            SizedBox(height: 20.h),
            const MadeBy(),
            SizedBox(height: 15.h),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CartPage(),
          ));
        },
        icon: const Icon(Icons.shopping_cart),
        label: const Text('Cart'),
      ),
    );
  }
}
