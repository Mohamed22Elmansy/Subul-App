import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/login_page_cubit.dart';
import 'package:graduation/businessLogic/cubit/regist_cubit.dart';
import 'package:graduation/presentation/Screens/Login_Screen.dart';
import 'package:graduation/presentation/Widgets/Dialog.dart';
import 'package:graduation/presentation/Widgets/TextField.dart';

class RegistScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  TextEditingController firstnameControler = TextEditingController();
  TextEditingController secondnameControler = TextEditingController();
  TextEditingController statusControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pageheight = MediaQuery.of(context).size.height;
    final pagewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: pagewidth,
        height: pageheight,
        decoration: BoxDecoration(
            image: DecorationImage(
          image:
              Image.asset('assets/images/Regist.png', fit: BoxFit.fill).image,
        )),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: pageheight / 3,
                  child: Center(
                    child: Text(
                      "إنشاء حساب",
                      style: TextStyle(
                        fontFamily: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.fontFamily,
                        color: Colors.black,
                        fontSize: pagewidth / 10,
                        fontWeight: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.fontWeight,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: pagewidth - 15,
                  child: TextFielld(
                    editingController: firstnameControler,
                    hintText: "الأسم الأول",
                    keyboardType: TextInputType.name,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "الاسـم غير صالح";
                      }
                      return null;
                    },
                    obscureText: false,
                    icon: Icons.person,
                  ),
                ),
                SizedBox(
                  width: pagewidth - 15,
                  child: TextFielld(
                    editingController: secondnameControler,
                    hintText: "الأسم الأخير",
                    keyboardType: TextInputType.name,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "الاسـم غير صالح";
                      }
                      return null;
                    },
                    obscureText: false,
                    icon: Icons.person,
                  ),
                ),
                SizedBox(
                  width: pagewidth - 15,
                  child: TextFielld(
                    editingController: emailControler,
                    hintText: "بريدك الالكتروني",
                    icon: Icons.email_rounded,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || !value.contains("@gmail")) {
                        return "بريد غير صالح";
                      }
                      return null;
                    },
                  ),
                ),
                BlocBuilder<LoginPageCubit, LoginPageState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: pagewidth - 15,
                      child: TextFielld(
                        editingController: passwordControler,
                        hintText: "الرقم السـري",
                        keyboardType: TextInputType.name,
                        icon: Icons.password_sharp,
                        obscureText: BlocProvider.of<LoginPageCubit>(context)
                            .passVisible,
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
                          if (value!.isEmpty || value.length < 7) {
                            return "كلمه المرور ضعيفه جدا";
                          }

                          return null;
                        },
                      ),
                    );
                  },
                ),
                BlocBuilder<LoginPageCubit, LoginPageState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: pagewidth - 15,
                      child: TextFielld(
                        editingController: confirmPasswordControler,
                        hintText: "تاكيد الرقم السـري",
                        keyboardType: TextInputType.name,
                        icon: Icons.password_sharp,
                        obscureText: BlocProvider.of<LoginPageCubit>(context)
                            .passVisible,
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
                          if (value != passwordControler.text) {
                            return "كلمه المرور غير متطابقه";
                          }

                          return null;
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: pagewidth - 15,
                  child: TextFielld(
                    editingController: phoneControler,
                    hintText: "رقم الهاتف",
                    keyboardType: TextInputType.phone,
                    icon: Icons.phone,
                    obscureText: false,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || value.length < 11) {
                        return "رقم هاتف غير صالح";
                      }

                      return null;
                    },
                  ),
                ),
                BlocBuilder<RegistCubit, RegistState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Radio<Gender>(
                                value: Gender.male,
                                groupValue:
                                    BlocProvider.of<RegistCubit>(context)
                                        .gender,
                                onChanged: (Gender? value) {
                                  BlocProvider.of<RegistCubit>(context)
                                      .selectGender(value);
                                }),
                            Text(
                              "ذكـر",
                              style: TextStyle(
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.fontFamily,
                                color: Colors.white,
                                fontSize: pagewidth / 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<Gender>(
                                value: Gender.female,
                                groupValue:
                                    BlocProvider.of<RegistCubit>(context)
                                        .gender,
                                onChanged: (Gender? value) {
                                  BlocProvider.of<RegistCubit>(context)
                                      .selectGender(value);
                                }),
                            Text(
                              "انثـي",
                              style: TextStyle(
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.fontFamily,
                                color: Colors.white,
                                fontSize: pagewidth / 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: pagewidth / 15,
                                  vertical: pagewidth / 28))),
                      child: Text(
                        "لديك حساب؟",
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<RegistCubit, RegistState>(
                      builder: (context, state) {
                        return Builder(builder: (ctx) {
                          return ElevatedButton(
                            onPressed: () {
                              if (BlocProvider.of<RegistCubit>(context)
                                      .gender ==
                                  null) {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => ShowMyDialog(
                                        contentText: "اختر النوع ",
                                        fontSize: pagewidth / 20));
                              } else if (formKey.currentState!.validate()) {
                                BlocProvider.of<RegistCubit>(context).regist(
                                    firstName: firstnameControler.text
                                        .trim()
                                        .toString(),
                                    lastName: secondnameControler.text
                                        .trim()
                                        .toString(),
                                    email:
                                        emailControler.text.trim().toString(),
                                    password: passwordControler.text.toString(),
                                    phone:
                                        phoneControler.text.trim().toString(),
                                    gender:
                                        BlocProvider.of<RegistCubit>(context)
                                            .userGender!,
                                    context: context,
                                    contantLable: "خطأ في إنشاء الحساب",
                                    fontSize: pagewidth / 20);
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(145, 104, 58, 1),
                              ),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: pagewidth / 15,
                                    vertical: pagewidth / 28),
                              ),
                            ),
                            child: BlocBuilder<RegistCubit, RegistState>(
                              builder: (context, state) {
                                return Text(
                                  BlocProvider.of<RegistCubit>(context)
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
                                );
                              },
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
