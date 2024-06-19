import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key, required this.onTap});
  Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: onTap,
      // currentIndex: selected_index,
      items: const [
        Icon(
          Icons.home,
          color: Color.fromRGBO(145, 104, 58, 1),
        ),
        Icon(
          Icons.person_2_sharp,
          color: Color.fromRGBO(145, 104, 58, 1),
        ),
        Icon(
          Icons.shopping_cart_sharp,
          color: Color.fromRGBO(145, 104, 58, 1),
        ),
      ],
      color: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: const Color.fromRGBO(145, 104, 58, 1),
      height: 55,
      animationDuration: const Duration(milliseconds: 800),
      animationCurve: Curves.linear,
      // buttonBackgroundColor: Colors.black.withOpacity(0.3),
    );
  }
}
