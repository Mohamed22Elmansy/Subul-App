import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/registcharity_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../businessLogic/cubit/cubit/pick_image_cubit.dart';
import '../../businessLogic/cubit/login_page_cubit.dart';
import '../Widgets/Dialog.dart';
import '../Widgets/PichImageDialog.dart';
import '../Widgets/TextField.dart';
import 'Login_Screen.dart';

class RegistCharity extends StatelessWidget {
  RegistCharity({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  TextEditingController nameControler = TextEditingController();
  TextEditingController declarationControler = TextEditingController();
  TextEditingController cityControler = TextEditingController();
  TextEditingController numControler = TextEditingController();
  TextEditingController dateControler = TextEditingController();
  TextEditingController websiteControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height / 70,
                ),
                SizedBox(
                  height: width / 3,
                  child: Center(
                    child: Text(
                      "  حساب جمعيه",
                      style: TextStyle(
                        fontFamily: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.fontFamily,
                        color: Theme.of(context).textTheme.displayLarge?.color,
                        fontSize: width / 10,
                        fontWeight: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.fontWeight,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width - 15,
                  child: TextFielld(
                    editingController: nameControler,
                    hintText: "اسم الجمعيه",
                    keyboardType: TextInputType.name,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "الاسـم غير صالح";
                      }
                      return null;
                    },
                    obscureText: false,
                    icon: Icons.group_add,
                  ),
                ),
                SizedBox(
                  width: width - 15,
                  child: TextFielld(
                    editingController: emailControler,
                    hintText: "البريد الالكتروني",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "الاسـم غير صالح";
                      }
                      return null;
                    },
                    obscureText: false,
                    icon: Icons.email,
                  ),
                ),
                SizedBox(
                  width: width - 15,
                  child: TextFielld(
                    editingController: declarationControler,
                    hintText: "الوصف",
                    keyboardType: TextInputType.name,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "الاسـم غير صالح";
                      }
                      return null;
                    },
                    obscureText: false,
                    icon: Icons.description,
                  ),
                ),
                BlocBuilder<LoginPageCubit, LoginPageState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: width - 15,
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
                      width: width - 15,
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
                  width: width - 15,
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
                SizedBox(
                  width: width - 15,
                  child: TextFielld(
                    editingController: cityControler,
                    hintText: "المحافظه",
                    keyboardType: TextInputType.name,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "الاسـم غير صالح";
                      }
                      return null;
                    },
                    obscureText: false,
                    icon: Icons.location_city,
                  ),
                ),
                SizedBox(
                  height: width / 3,
                  child: Center(
                    child: Text(
                      "بيانات الجمعيه",
                      style: TextStyle(
                        fontFamily: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.fontFamily,
                        color: Theme.of(context).textTheme.displayLarge?.color,
                        fontSize: width / 10,
                        fontWeight: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.fontWeight,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width - 15,
                  child: TextFielld(
                    editingController: websiteControler,
                    hintText: "الموقع الالكتروني",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "الاسـم غير صالح";
                      }
                      return null;
                    },
                    obscureText: false,
                    icon: Icons.web_rounded,
                  ),
                ),
                SizedBox(
                  width: width - 15,
                  child: TextFielld(
                    editingController: numControler,
                    hintText: "رقم التسجيل الضريبي",
                    keyboardType: TextInputType.phone,
                    icon: Icons.nature,
                    obscureText: false,
                    suffixIcon: null,
                    validatorfun: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: width - 40,
                  child: TextField(
                    onTap: () {
                      BlocProvider.of<RegistcharityCubit>(context)
                          .selectDate(context)
                          .then((val) {
                        dateControler.text =
                            BlocProvider.of<RegistcharityCubit>(context)
                                .selectedDate
                                .toString();
                      });
                    },
                    controller: dateControler,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(145, 104, 58, 1)),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(145, 104, 58, 1)),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      hintText: "تاريخ الانشاء",
                      errorStyle: const TextStyle(
                        fontFamily: "Tajawal",
                        fontSize: 18,
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 18,
                          color: Color.fromRGBO(145, 104, 58, 1)),
                      hintTextDirection: TextDirection.rtl,
                      prefixIcon: const Icon(
                        Icons.date_range,
                        color: Color.fromRGBO(145, 104, 58, 1),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<PickImageCubit, PickImageState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return PickImageDialog(onPressedCamera: () {
                                BlocProvider.of<PickImageCubit>(context)
                                    .pickImage(ImageSource.camera)
                                    .then((val) => Navigator.of(context).pop());
                              }, onPressedGallery: () {
                                BlocProvider.of<PickImageCubit>(context)
                                    .pickImage(ImageSource.gallery)
                                    .then((val) => Navigator.of(context).pop());
                              });
                            });
                      },
                      child: Container(
                        width: width / 4,
                        height: width / 4,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(145, 104, 58, 1),
                            shape: BoxShape.circle),
                        child: BlocProvider.of<PickImageCubit>(context).image !=
                                null
                            ? Image.file(
                                BlocProvider.of<PickImageCubit>(context).image!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: width / 8,
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height / 50,
                ),
                Row(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                              horizontal: width / 15, vertical: width / 28))),
                      child: Text(
                        "لديك حساب؟",
                        style: TextStyle(
                          fontFamily: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.fontFamily,
                          color: const Color.fromRGBO(145, 104, 58, 1),
                          fontSize: width / 16,
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
                    BlocBuilder<RegistcharityCubit, RegistcharityState>(
                      builder: (context, state) {
                        return Builder(builder: (ctx) {
                          return ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<RegistcharityCubit>(context)
                                    .regist(
                                        name: nameControler.text,
                                        password: passwordControler.text,
                                        email: emailControler.text,
                                        website: websiteControler.text,
                                        phone: phoneControler.text,
                                        describtion: dateControler.text,
                                        registeredNumber: numControler.text,
                                        establishedDate: dateControler.text,
                                        charityLocation: cityControler.text,
                                        context: context,
                                        contantLable: "خطأ في إنشاء الحساب",
                                        fontSize: width / 20);
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
                                    horizontal: width / 15,
                                    vertical: width / 28),
                              ),
                            ),
                            child: BlocBuilder<RegistcharityCubit,
                                RegistcharityState>(
                              builder: (context, state) {
                                return Text(
                                  BlocProvider.of<RegistcharityCubit>(context)
                                      .buttonLable,
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.fontFamily,
                                    color: Colors.white,
                                    fontSize: width / 19,
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
          )),
    );
  }
}
