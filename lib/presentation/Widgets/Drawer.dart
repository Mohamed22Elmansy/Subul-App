import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:graduation/presentation/Screens/AboutUsScreen.dart';
import 'package:graduation/presentation/Screens/AddedCases.dart';
import 'package:graduation/presentation/Screens/Login_Screen.dart';
import 'package:graduation/presentation/Screens/NavBarScreen.dart';
import 'package:graduation/presentation/Screens/UserProfile.dart';
import 'package:graduation/presentation/Widgets/DrawerCard.dart';

import '../../businessLogic/cubit/cubit/user_profile_cubit.dart';
import '../Screens/PayZakaScreen.dart';
import '../Screens/TabraScreen.dart';

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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Tabra()));
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.solidMuslim2,
          title: 'كفارات',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Tabra()));
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.cow,
          title: 'اضـاحي',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Tabra()));
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.family,
          title: 'زكاه',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => PayElzaka()));
          },
        ),
        DrawerCard(
          icon: FlutterIslamicIcons.community,
          title: 'تبرع بالدم',
          onTap: () {
            /*  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) =>  Tabra()));*/
          },
        ),
        DrawerCard(
          icon: Icons.shopping_cart_sharp,
          title: 'عربه التسوق',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const AddedCases()));
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
              BlocProvider.of<UserProfileCubit>(context).isLogin!
                  ? MaterialPageRoute(
                      builder: (context) => UserProfile(),
                    )
                  : MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
            );
          },
        ),
      ]),
    );
  }
}
