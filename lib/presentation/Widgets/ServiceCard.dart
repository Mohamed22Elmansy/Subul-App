import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ServiceCard extends StatelessWidget {
  ServiceCard({super.key, required this.headtitle, required this.subtitle , required this.imagePath});
  String headtitle;
  String subtitle;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: width / 1.4,
        child: Card(
          elevation: 5,
          shadowColor: const Color.fromRGBO(145, 104, 58, 1),
          surfaceTintColor: const Color.fromRGBO(145, 104, 58, 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(imagePath),
                SizedBox(
                  height: height / 120,
                ),
                Text(
                  headtitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width / 13,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height / 120,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ReadMoreText(
                    trimLength: 100,
                    "$subtitle    ",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: const Color.fromRGBO(145, 104, 58, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: width / 18,
                    ),
                    moreStyle: const TextStyle(color: Colors.blueGrey),
                    lessStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromRGBO(145, 104, 58, 1))),
                  child: Text(
                    "المز يـد",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width / 19,
                        fontFamily: "Cairo"),
                  ),
                ),
                SizedBox(
                  height: height / 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
