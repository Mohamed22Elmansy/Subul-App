import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/reset_password_cubit.dart';

import '../Widgets/TextField.dart';

class resetPasswordPage extends StatelessWidget {
  resetPasswordPage(
      {super.key,
      required this.tokenController,
      required this.emailController,
      required this.newpasswordControler});
  TextEditingController tokenController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController newpasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pageheight = MediaQuery.of(context).size.height;
    final pagewidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return SizedBox(
          height: pagewidth,
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            alignment: Alignment.center,
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (tokenController.text.isNotEmpty &&
                      newpasswordControler.text.isNotEmpty &&
                      emailController.text.isNotEmpty) {
                    BlocProvider.of<ResetPasswordCubit>(context).resetPassword(
                        token: tokenController.text.trim(),
                        email: emailController.text.trim(),
                        newPassword: newpasswordControler.text,
                        context: context);
                  }
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromRGBO(145, 104, 58, 1),
                  ),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(
                        horizontal: pagewidth / 15, vertical: pagewidth / 28),
                  ),
                ),
                child: Text(
                  BlocProvider.of<ResetPasswordCubit>(context).buttonLable,
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.displayLarge?.fontFamily,
                    color: Colors.white,
                    fontSize: pagewidth / 19,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
            content: SizedBox(
              height: pageheight / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFielld(
                    editingController: tokenController,
                    hintText: "رمز التاكيد",
                    icon: Icons.email_rounded,
                    suffixIcon: null,
                    validatorfun: (value) {
                      return;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  TextFielld(
                    editingController: newpasswordControler,
                    hintText: "كلمه السر الجديده",
                    icon: Icons.password_outlined,
                    suffixIcon: null,
                    validatorfun: (value) {
                      return;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
