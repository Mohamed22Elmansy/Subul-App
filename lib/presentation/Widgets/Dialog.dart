import 'package:flutter/material.dart';

class ShowMyDialog extends StatelessWidget {
  ShowMyDialog({super.key, required this.contentText, required this.fontSize});
  String? contentText;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 3,
      shadowColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      content: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            contentText!,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.displayLarge?.fontFamily,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
