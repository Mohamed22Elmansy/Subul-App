import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/cubit/booked_cases_cubit.dart';
import 'package:graduation/data/server/cacheHelper.dart';

import '../Screens/TabraMostamal.dart';
import '../Screens/TabraScreen.dart';

class TabraHalatCard extends StatelessWidget {
   TabraHalatCard({super.key , required this.bookfun});
  Function()? bookfun ;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 10,
      shadowColor: const Color.fromARGB(255, 246, 220, 189),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromRGBO(221, 221, 221, 1),
        ),
        height: height / 2.5,
        width: width / 2,
        child: Column(
          children: [
            SizedBox(
              width: width / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/ملابس.jpg",
                  fit: BoxFit.fill,
                  height: height / 9,
                ),
              ),
            ),
            Text(
              "تبرع بالملابس",
              style: TextStyle(
                color: Colors.black,
                fontSize: width / 17,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              "وفرلهم احتياجهم من الملابس لانهم بحاله صعبه وتحتاج الي مساعدتك",
              style: TextStyle(
                color: Colors.black,
                fontSize: width / 30,
                fontFamily: "Cairo",
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height / 190,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 246, 220, 189),
              ),
              width: width / 2,
              height: height / 10,
              child: Column(
                children: [
                  Slider(
                    onChanged: (value) {},
                    label: "المبلغ",
                    value: 65,
                    min: 0,
                    max: 100,
                    activeColor: Colors.blueGrey[900],
                    inactiveColor: Colors.grey[500],
                    thumbColor: Colors.blueGrey[900],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP 50,000 ",
                          style: TextStyle(
                            fontSize: width / 45,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          "EGP 35,000 ",
                          style: TextStyle(
                            fontSize: width / 45,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الهدف",
                          style: TextStyle(
                            fontSize: width / 35,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "المتبقي",
                          style: TextStyle(
                            fontSize: width / 35,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:bookfun,
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 244, 243, 243))),
                  child: const Icon(Icons.shopping_cart_sharp),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Mostamal()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromRGBO(145, 104, 58, 1))),
                  child: Text(
                    " تبرع",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: width / 35,
                        fontFamily: "Cairo"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
