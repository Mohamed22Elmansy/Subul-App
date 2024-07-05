import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Widgets/CircleCard.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "معلوماتك",
          style: TextStyle(
            color: const Color.fromRGBO(145, 104, 58, 1),
            fontSize: width / 11,
            fontFamily: "BlakaHollow",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: height / 70,
          ),
          Center(
            child: Text(
              DateFormat('EEEE').format(DateTime.now()).toString(),
              style: TextStyle(
                color: const Color.fromRGBO(145, 104, 58, 1),
                fontSize: width / 16,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          Center(
            child: Text(
              DateFormat('yyyy-MM-dd – kk:mm')
                  .format(DateTime.now())
                  .toString(),
              style: TextStyle(
                color: const Color.fromRGBO(145, 104, 58, 1),
                fontSize: width / 16,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: width / 30,
              ),
              Text(
                "عدد التبرعات",
                style: TextStyle(
                  color: const Color.fromRGBO(145, 104, 58, 1),
                  fontSize: width / 16,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: width / 30,
              ),
              Icon(
                Icons.people,
                size: width / 7,
                color: Colors.grey,
              ),
              SizedBox(
                height: height / 70,
              ),
              SizedBox(
                width: width / 30,
              ),
            ],
          ),
          CircleCard(
            number: "222",
            title: "تبرعاتك",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: width / 30,
              ),
              Text(
                "عدد الحالات",
                style: TextStyle(
                  color: const Color.fromRGBO(145, 104, 58, 1),
                  fontSize: width / 16,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: width / 30,
              ),
              Icon(
                Icons.people,
                size: width / 7,
                color: Colors.grey,
              ),
              SizedBox(
                height: height / 70,
              ),
              SizedBox(
                width: width / 30,
              ),
            ],
          ),
          CircleCard(
            number: "222",
            title: "تبرعاتك",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: width / 30,
              ),
              Text(
                "المبلغ الكلي",
                style: TextStyle(
                  color: const Color.fromRGBO(145, 104, 58, 1),
                  fontSize: width / 16,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: width / 30,
              ),
              Icon(
                Icons.monetization_on,
                size: width / 7,
                color: Colors.grey,
              ),
              SizedBox(
                height: height / 70,
              ),
              SizedBox(
                width: width / 30,
              ),
            ],
          ),
          CircleCard(
            number: "222",
            title: "تبرعاتك",
          ),
        ],
      ),
    );
  }
}
