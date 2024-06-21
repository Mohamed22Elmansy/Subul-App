import 'package:flutter/material.dart';

class CircleCard extends StatelessWidget {
  CircleCard({super.key, required this.title, required this.number});
  String title;
  String number;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: CircleAvatar(
        
        radius: width / 8,
        backgroundColor: const Color.fromRGBO(246, 205, 157, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 40,
              width: double.infinity,
            ),
            Text(
              softWrap: true,
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(0.75),
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: width / 18,
                overflow: TextOverflow.ellipsis,
                fontFamily: "Tajawal",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height / 350,
              width: double.infinity,
            ),
            Text(
              number,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: width / 14,
                fontFamily: "Tajawal",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
