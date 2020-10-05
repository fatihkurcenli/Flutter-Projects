import 'package:flutter/material.dart';
import 'package:food_ordering_app/components/bottom_nav_bar.dart';
import 'components/app_bar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}
