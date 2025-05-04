import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  static const String route = '/notification';
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[SliverAppBar()],
      ),
    );
  }
}
