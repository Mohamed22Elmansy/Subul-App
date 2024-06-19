import 'package:flutter/material.dart';

class TextFielld extends StatelessWidget {
  TextEditingController? editingController;
  String? hintText;
  IconData? icon;
  Widget? suffixIcon;
  bool? obscureText;
  TextInputType? keyboardType;
  String? Function(String?)? validatorfun;
  TextFielld(
      {super.key,
      required this.editingController,
      required this.hintText,
      required this.icon,
      required this.suffixIcon,
      required this.validatorfun,
      required this.obscureText,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
      child: TextFormField(
          obscureText: obscureText!,
          keyboardType: keyboardType,
          style: TextStyle(color: Theme.of(context).primaryColor),
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromRGBO(145, 104, 58, 1)),
              borderRadius: BorderRadius.circular(23),
            ),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromRGBO(145, 104, 58, 1)),
              borderRadius: BorderRadius.circular(23),
            ),
            hintText: hintText,
            errorStyle: const TextStyle(
              fontFamily: "Tajawal",
              fontSize: 18,
            ),
            hintStyle: const TextStyle(
                fontFamily: "Tajawal",
                fontSize: 18,
                color: Color.fromRGBO(145, 104, 58, 1)),
            hintTextDirection: TextDirection.rtl,
            suffixIcon: suffixIcon,
            prefixIcon: Icon(
              icon,
              color: const Color.fromRGBO(145, 104, 58, 1),
            ),
          ),
          controller: editingController,
          validator: validatorfun),
    );
    ;
  }
}
