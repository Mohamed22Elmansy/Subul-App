import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  DrawerCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});
  IconData icon;
  String title;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      shadowColor: const Color.fromRGBO(243, 212, 174, 1),
      elevation: 5,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
          trailing: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          leading: Icon(
            icon,
            color: Color.fromARGB(255, 153, 101, 41),
            size: width / 11,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 145, 95, 38),
              fontSize: width / 20,
              fontFamily: Theme.of(context).textTheme.displayLarge?.fontFamily,
            ),
          ),
          onTap: onTap),
    );
  }
}
