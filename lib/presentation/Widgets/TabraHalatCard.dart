import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/cubit/booked_cases_cubit.dart';
import 'package:graduation/data/server/cacheHelper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/server/diohellper.dart';
import '../Screens/TabraMostamal.dart';
import '../Screens/TabraScreen.dart';

class TabraHalatCard extends StatefulWidget {
  TabraHalatCard(
      {super.key,
      required this.describtion,
      required this.bookfun,
      required this.amount,
      required this.caseId,
      required this.total,
      required this.charityId,
      required this.title});
  Function()? bookfun;
  String title;
  String describtion;
  String caseId;
  String charityId;
  String amount;
  String total;

  @override
  State<TabraHalatCard> createState() => _TabraHalatCardState();
}

class _TabraHalatCardState extends State<TabraHalatCard> {
  String mainTypePayment = "onlineCard";

  @override
  Widget build(BuildContext context) {
    String? current = "100";
    String? remain =
        (double.parse(widget.total) - double.parse(current)).toString();
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
                  "assets/images/children.png",
                  fit: BoxFit.fill,
                  height: height / 9,
                ),
              ),
            ),
            Text(
              widget.title,
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
              widget.describtion,
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
                    value: double.parse(current),
                    min: 0,
                    max: double.parse(widget.total),
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
                          widget.total,
                          style: TextStyle(
                            fontSize: width / 45,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          remain,
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
                  onPressed: widget.bookfun,
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 244, 243, 243))),
                  child: const Icon(Icons.shopping_cart_sharp),
                ),
                ElevatedButton(
                  onPressed: () {
                    try {
                      DioHelper.PostTransaction(
                              amount: widget.amount,
                              caseid: widget.caseId,
                              charityid: widget.charityId,
                              title: widget.title)
                          .then((val) async {
                        if (val != null) {
                          print(val.data["url"]);
                          if (await launchUrl(Uri.parse(val.data["url"]))) {
                            await launchUrl(
                              Uri.parse(val.data["url"]),
                              mode: LaunchMode.inAppBrowserView,
                            ).then((val) {});
                            setState(() {
                              current = (double.parse(current!) +
                                      double.parse(widget.amount))
                                  .toString();
                              remain = (double.parse(widget.total) -
                                      double.parse(widget.amount))
                                  .toString();
                            });
                          } else {
                            print("can not lanch");
                          }
                        } else {
                          print("error");
                        }
                      });
                    } catch (e) {
                      print(e);
                    }
                    /*  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Mostamal()),
                    );*/
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
