import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:graduation/presentation/Screens/AboutUsScreen.dart';
import 'package:graduation/presentation/Screens/Login_Screen.dart';
import 'package:graduation/presentation/Screens/NavBarScreen.dart';
import 'package:graduation/presentation/Widgets/DrawerCard.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(145, 104, 58, 1),
      child: ListView(children: [
        DrawerHeader(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/children.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        DrawerCard(
          icon: Icons.home,
          title: 'الرئيسـيه',
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const NavBarScreen()));
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.allah99,
          title: 'صـدقات',
          onTap: () {
            /* Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const Sadaqat()));*/
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.solidMuslim2,
          title: 'كفارات',
          onTap: () {
            /* Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Qafarat()));*/
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.cow,
          title: 'اضـاحي',
          onTap: () {
            /*  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Adahy()));*/
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.family,
          title: 'زكاه',
          onTap: () {
            /*  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Zakaa()));*/
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.community,
          title: 'تبرع بالدم',
          onTap: () {
            /*  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Blood()));*/
          },
        ),
        DrawerCard(
          icon: Icons.shopping_cart_sharp,
          title: 'عربه التسوق',
          onTap: () {
            /*  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const ShoppingCart()));*/
          },
        ),
        DrawerCard(
          icon: Icons.info,
          title: 'About Us',
          onTap: () {
             Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const AboutUsScreen()));
          },
        ),
        DrawerCard(
          icon: Icons.person_2_sharp,
          title: ' حسـابي',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
      ]),
    );
  }
}
