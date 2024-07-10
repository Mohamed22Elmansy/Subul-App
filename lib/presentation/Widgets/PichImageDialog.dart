import 'package:flutter/material.dart';

class PickImageDialog extends StatelessWidget {
  PickImageDialog({super.key, required this.onPressedCamera , required this.onPressedGallery});
  Function() onPressedCamera;
  Function() onPressedGallery;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AlertDialog(
      icon: const Icon(Icons.camera_alt),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SizedBox(
        height: height / 4,
        child: Column(
          children: [
            Text(
              "التقاط الصوره من",
              style: TextStyle(
                color: const Color.fromRGBO(145, 104, 58, 1),
                fontSize: width / 18,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height / 70,
            ),
            ElevatedButton(
              onPressed: onPressedCamera , 
             
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(145, 104, 58, 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "الكاميرا",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width / 19,
                      fontFamily: "Cairo"),
                ),
              ),
            ),
            SizedBox(
              height: height / 70,
            ),
            ElevatedButton(
              onPressed: onPressedGallery, 
             
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(145, 104, 58, 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "المعرض",
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
