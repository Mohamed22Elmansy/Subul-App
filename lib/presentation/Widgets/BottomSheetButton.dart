import 'package:flutter/material.dart';

class BootomSheetButton extends StatelessWidget {
   BootomSheetButton({super.key ,required this.buttonText,required this.onPressed});
  String buttonText;
   Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  fixedSize:
                      WidgetStateProperty.all(Size.fromWidth(width / 1.25),),
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 59, 59, 59))),
              child: Text(
                buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: width / 19,
                    fontFamily: "Cairo"),
              ),
            );
  }
}