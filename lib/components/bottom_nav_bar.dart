import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          color: Colors.amber[700],
          activeColor: Colors.white,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.amber.shade700,
          tabBorderRadius: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          onTabChange: (value) => onTabChange!(value),
          gap: 8,
          tabs: [
            const GButton(
              icon: Icons.home,
              text: 'Shop',
            ),
            const GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
          ],
        ));
  }
}
