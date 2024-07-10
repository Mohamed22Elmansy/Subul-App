import 'package:flutter/material.dart';
import 'package:graduation/data/server/cacheHelper.dart';

class SelectType extends StatelessWidget {
  const SelectType({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      icon: const Icon(Icons.app_registration),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SizedBox(
        height: height / 4,
        child: Column(
          children: [
            Text(
              "نوع الحساب",
              style: TextStyle(
                color: const Color.fromRGBO(145, 104, 58, 1),
                fontSize: width / 18,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: width / 70,
            ),
            ElevatedButton(
              onPressed: () {
                CacheHelper.storetype("user").then((v) {
                  Navigator.of(context).pop();
                });
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(145, 104, 58, 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "مستخدم",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width / 19,
                      fontFamily: "Cairo"),
                ),
              ),
            ),
            SizedBox(
              height: width / 70,
            ),
            ElevatedButton(
              onPressed: () {
                CacheHelper.storetype("charity");
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(145, 104, 58, 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "جمعيه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width / 19,
                      fontFamily: "Cairo"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
