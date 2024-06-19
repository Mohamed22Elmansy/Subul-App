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
      color: Colors.white,
      child: ListTile(
          trailing: const Icon(Icons.arrow_back_ios),
          leading: Icon(
            icon,
            color: const Color.fromRGBO(145, 104, 58, 1),
            size: 20,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: const Color.fromRGBO(145, 104, 58, 1),
              fontSize: width / 5,
              fontFamily: Theme.of(context).textTheme.displayLarge?.fontFamily,
            ),
          ),
          onTap: onTap),
    );
  }
}
