import 'package:flutter/material.dart';

class MadeBy extends StatelessWidget {
  const MadeBy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Made By Mhmd Fouda'));
  }
}

class RecentOrderText extends StatelessWidget {
  const RecentOrderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8,
      ),
      child: Text(
        'Recent Orders',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
