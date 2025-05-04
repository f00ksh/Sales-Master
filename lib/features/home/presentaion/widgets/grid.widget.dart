import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sales_master/features/analytics/presentation/pages/analytics.dart';
import 'package:sales_master/features/client/presentation/pages/all_clients_page.dart';
import 'package:sales_master/features/product/presentation/pages/all_products.dart';
import 'package:sales_master/shared/widgets/card.widget.dart';
import 'package:sales_master/features/order/presentation/pages/all_orders.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeCardWidget(
              title: 'Clients',
              icon: FontAwesomeIcons.users,
              route: AllClientsPage(),
              colorValue: 0xffcce8ca,
            ),
            SizedBox(
              width: 7.w,
            ),
            const HomeCardWidget(
              title: 'Products',
              icon: FontAwesomeIcons.boxArchive,
              route: AllProductsPage(),
              colorValue: 0xfff1bb9e,
            ),
          ],
        ),
        SizedBox(height: 7.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeCardWidget(
              title: 'Orders',
              icon: FontAwesomeIcons.fileInvoiceDollar,
              route: AllOrdersPage(),
              colorValue: 0xff91c7e7,
            ),
            SizedBox(
              width: 7.w,
            ),
            const HomeCardWidget(
              title: 'Analytics',
              icon: FontAwesomeIcons.chartSimple,
              route: AnalyticsPage(),
              colorValue: 0xff9fa3ff,
            ),
          ],
        ),
      ],
    );
  }
}
