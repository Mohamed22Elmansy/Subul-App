import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/login_page_cubit.dart';
import 'package:graduation/businessLogic/cubit/reset_password_cubit.dart';
import 'package:graduation/presentation/Screens/RegistCharity.dart';
import 'package:graduation/presentation/Screens/registScreen.dart';
import 'package:graduation/presentation/Widgets/Dialog.dart';
import 'package:graduation/presentation/Widgets/TextField.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController confirmEmailControler = TextEditingController();
  TextEditingController tokenControler = TextEditingController();
  TextEditingController newpasswordControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pageheight = MediaQuery.of(context).size.height;
    final pagewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(children: [
        Positioned(
          top: -pageheight / 2,
          right: pagewidth / 5,
          child: Container(
            width: pagewidth * 1.25,
            height: pageheight,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(145, 104, 58, 1), shape: BoxShape.circle),
          ),
        ),
        Positioned(
          top: pageheight / 3,
          left: pagewidth / 28,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "تسـجيل الدخول",
                      style: TextStyle(
                        fontFamily: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.fontFamily,
                        color: Theme.of(context).textTheme.displayLarge?.color,
                        fontSize: pagewidth / 10,
                        fontWeight: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.fontWeight,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      child: TextFielld(
                        editingController: emailControler,
                        hintText: "بريـدك الإلكتروني",
                        icon: Icons.email_rounded,
                        suffixIcon: null,
                        validatorfun: (value) {
                          if (value!.isEmpty || !value.contains("@gmail")) {
                            return "بريدك غير صالح  ";
                          }
                          return null;
                        },
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    BlocBuilder<LoginPageCubit, LoginPageState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: TextFielld(
                              editingController: passwordControler,
                              hintText: "الـرقم السـري",
                              icon: Icons.password_sharp,
                              suffixIcon: IconButton(
                                icon: BlocProvider.of<LoginPageCubit>(context)
                                        .passVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                color: Colors.black,
                                onPressed: () {
                                  BlocProvider.of<LoginPageCubit>(context)
                                      .changeVisiblity();
                                },
                              ),
                              validatorfun: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return "كلمة مرور غير صالحه";
                                }

                                return null;
                              },
                              obscureText:
                                  BlocProvider.of<LoginPageCubit>(context)
                                      .passVisible,
                              keyboardType: TextInputType.name),
                        );
                      },
                    ),
                    BlocBuilder<LoginPageCubit, LoginPageState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: RadioListTile(
                            fillColor: WidgetStateProperty.all(
                              const Color.fromRGBO(145, 104, 58, 1),
                            ),
                            title: Text(
                              "    تسجيل الدخول كفرد (متبرع)",
                              style: TextStyle(
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.fontFamily,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.color,
                                fontSize: pagewidth / 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: Logintype.user,
                            groupValue: BlocProvider.of<LoginPageCubit>(context)
                                .logintype,
                            onChanged: (Logintype? value) {
                              BlocProvider.of<LoginPageCubit>(context)
                                  .loginType(value);
                            },
                          ),
                        );
                      },
                    ),
                    BlocBuilder<LoginPageCubit, LoginPageState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: RadioListTile(
                            title: Text(
                              "تسجيل الدخول كجمعيه خيريه",
                              style: TextStyle(
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.fontFamily,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.color,
                                fontSize: pagewidth / 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: Logintype.charity,
                            fillColor: WidgetStateProperty.all(
                              const Color.fromRGBO(145, 104, 58, 1),
                            ),
                            groupValue: BlocProvider.of<LoginPageCubit>(context)
                                .logintype,
                            onChanged: (Logintype? value) {
                              BlocProvider.of<LoginPageCubit>(context)
                                  .loginType(value);
                            },
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: pagewidth / 15,
                                      vertical: pagewidth / 28))),
                          child: Text(
                            " سجل الأن",
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.fontFamily,
                              color: const Color.fromRGBO(145, 104, 58, 1),
                              fontSize: pagewidth / 16,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              decorationStyle: TextDecorationStyle.solid,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            showDialog(context: context, builder: (ctx)=>AlertDialog(
      icon: const Icon(Icons.app_registration),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SizedBox(
        height: pageheight / 4,
        child: Column(
          children: [
            Text(
              "انشاء حساب",
              style: TextStyle(
                color: const Color.fromRGBO(145, 104, 58, 1),
                fontSize: pagewidth / 18,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: pageheight / 70,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegistScreen(),
                              ),
                            );
              } , 
             
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(145, 104, 58, 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "مستخدم",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: pagewidth / 19,
                      fontFamily: "Cairo"),
                ),
              ),
            ),
            SizedBox(
              height: pageheight / 70,
            ),
            ElevatedButton(
              onPressed: (){Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegistCharity(),
                              ),
                            );}, 
             
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(145, 104, 58, 1))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "جمعيه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: pagewidth / 19,
                      fontFamily: "Cairo"),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
                            
                          },
                        ),
                        Builder(builder: (ctx) {
                          return BlocBuilder<LoginPageCubit, LoginPageState>(
                            builder: (context, state) {
                              return ElevatedButton(
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
                                        horizontal: pagewidth / 15,
                                        vertical: pagewidth / 28),
                                  ),
                                ),
                                child: Text(
                                  BlocProvider.of<LoginPageCubit>(context)
                                      .buttonLable,
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.fontFamily,
                                    color: Colors.white,
                                    fontSize: pagewidth / 19,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () async {
                                  if (BlocProvider.of<LoginPageCubit>(context)
                                          .logintype ==
                                      null) {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => ShowMyDialog(
                                            contentText: "اختر نوع الدخول",
                                            fontSize: pagewidth / 20));
                                  } else if (formKey.currentState!.validate()) {
                                    BlocProvider.of<LoginPageCubit>(context)
                                        .Login(
                                            email: emailControler.text.trim(),
                                            fontSize: pagewidth / 20,
                                            password: passwordControler.text,
                                            contantText: "خطأ في تسجيل الدخول",
                                            context: context);
                                  } else {
                                    return;
                                  }
                                },
                              );
                            },
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: pagewidth / 45,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: pagewidth / 30,
                                  vertical: pagewidth / 50))),
                      child: Text(
                        "نسيت كلمه السر ؟",
                        style: TextStyle(
                          fontFamily: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.fontFamily,
                          color: const Color.fromRGBO(145, 104, 58, 1),
                          fontSize: pagewidth / 16,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.wavy,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => BlocBuilder<ResetPasswordCubit,
                                    ResetPasswordState>(
                                  builder: (context, state) {
                                    return AlertDialog(
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            if (confirmEmailControler
                                                .text.isNotEmpty) {
                                              BlocProvider.of<
                                                          ResetPasswordCubit>(
                                                      context)
                                                  .confirmEmail(
                                                      email:
                                                          confirmEmailControler
                                                              .text
                                                              .trim(),
                                                      context: context,
                                                      tokenController:
                                                          tokenControler,
                                                      emailController:
                                                          confirmEmailControler,
                                                      newpasswordControler:
                                                          newpasswordControler);
                                            }
                                          },
                                          style: ButtonStyle(
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                              const Color.fromRGBO(
                                                  145, 104, 58, 1),
                                            ),
                                            padding: WidgetStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: pagewidth / 15,
                                                  vertical: pagewidth / 28),
                                            ),
                                          ),
                                          child: Text(
                                            BlocProvider.of<ResetPasswordCubit>(
                                                    context)
                                                .buttonLable,
                                            style: TextStyle(
                                              fontFamily: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge
                                                  ?.fontFamily,
                                              color: Colors.white,
                                              fontSize: pagewidth / 19,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      content: TextFielld(
                                        editingController:
                                            confirmEmailControler,
                                        hintText: "بريـدك الإلكتروني",
                                        icon: Icons.email_rounded,
                                        suffixIcon: null,
                                        validatorfun: (value) {
                                          return;
                                        },
                                        obscureText: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    );
                                  },
                                ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
