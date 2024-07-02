import 'package:flutter/material.dart';
import 'package:graduation/presentation/Screens/AddPatient.dart';
import 'package:graduation/presentation/Screens/PayZakaScreen.dart';
import 'package:graduation/presentation/Screens/TabraMostamal.dart';
import 'package:graduation/presentation/Widgets/BottomSheetButton.dart';

import '../Screens/TabraScreen.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 2,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              tileMode: TileMode.clamp,
              colors: [
                Colors.grey,
                Color.fromRGBO(145, 104, 58, 1),
                Color.fromRGBO(187, 104, 27, 1),
                Color.fromRGBO(168, 82, 2, 1),
                Color.fromRGBO(185, 95, 12, 1),
                Colors.grey
              ])),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height / 20,
            ),
            BootomSheetButton(
              buttonText: "الابلاغ عن حاله",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddPatient()),
                );
              },
            ),
            SizedBox(
              height: height / 20,
            ),
            BootomSheetButton(
              buttonText: "تبرع بالمستعمل",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Mostamal()),
                );
              },
            ),
            SizedBox(
              height: height / 20,
            ),
            BootomSheetButton(
              buttonText: "قنوات التبرع",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Tabra()),
                );
              },
            ),
            SizedBox(
              height: height / 20,
            ),
            BootomSheetButton(
              buttonText: "دفع الزكاه",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PayElzaka()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
