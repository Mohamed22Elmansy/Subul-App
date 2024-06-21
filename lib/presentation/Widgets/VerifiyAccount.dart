import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';

import 'TextField.dart';

class VerifyAccount extends StatelessWidget {
  VerifyAccount(
      {super.key,
      required this.height,
      required this.width,
      required this.verifiyEmailController});
  TextEditingController verifiyEmailController;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.verified_user,
        size: width / 10,
        color: const Color.fromRGBO(145, 104, 58, 1),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
             
              BlocProvider.of<UserProfileCubit>(context)
                  .verifyAccount(token: verifiyEmailController.text.trim());
            },
            style: ElevatedButton.styleFrom(
                side: BorderSide.none,
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromRGBO(145, 104, 58, 1)),
            child: Text(
              "تفعيـل",
              style: TextStyle(
                color: Colors.white,
                fontSize: width / 14,
              ),
            ),
          ),
        ),
      ],
      alignment: Alignment.center,
      content: SizedBox(
        height: height / 3.5,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "إدخل الكود الذي تم ارساله الي بريدك الإكتروني",
            style: TextStyle(
              fontSize: width / 14,
              color: Colors.red,
              fontFamily: 'Cairo',
            ),
            textAlign: TextAlign.center,
          ),
          TextFielld(
              editingController: verifiyEmailController,
              hintText: "كود التفعيل",
              icon: Icons.verified_user_rounded,
              suffixIcon: null,
              validatorfun: (val) {
                return;
              },
              obscureText: false,
              keyboardType: TextInputType.multiline),
        ]),
      ),
    );
  }
}
