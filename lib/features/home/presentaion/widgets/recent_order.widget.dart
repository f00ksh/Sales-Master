import 'package:flutter/material.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final primary2 = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      height: 280,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(.6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            title: const Text('12-3-2022'),
            trailing: Icon(
              Icons.check_box,
              color: primary2,
            ),
          ),
          ListTile(
            title: const Text('11-4-2022'),
            trailing: Icon(
              Icons.check_box,
              color: primary2,
            ),
          ),
          ListTile(
            title: const Text('10-5-2022'),
            trailing: Icon(
              Icons.check_box,
              color: primary2,
            ),
          ),
          ListTile(
            title: const Text('9-6-2022'),
            trailing: Icon(
              Icons.check_box_outline_blank_sharp,
              color: primary2,
            ),
          ),
          ListTile(
            title: const Text('8-7-2022'),
            trailing: Icon(
              Icons.check_box,
              color: primary2,
            ),
          ),
        ],
      ),
    );
  }
}
