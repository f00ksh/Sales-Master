import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPage extends StatelessWidget {
  static const String route = '/user';
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Hero(
                  tag: 'user_image',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      "https://avatars.githubusercontent.com/u/8207775?s=400&u=3870f84efc3fa80741c322df30ba44e2d7738fa7&v=4",
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Mhmd Fouda',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Sign Out'),
        icon: const FaIcon(FontAwesomeIcons.solidCircleXmark),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
