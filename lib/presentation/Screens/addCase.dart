import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../businessLogic/cubit/cubit/pick_image_cubit.dart';
import '../../businessLogic/cubit/cubit/tabra_cubit.dart';
import '../../businessLogic/cubit/regist_cubit.dart';
import '../Widgets/PichImageDialog.dart';
import '../Widgets/TextField.dart';
import '../Widgets/tabraTile.dart';

class AddCase extends StatelessWidget {
  AddCase({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? declarationController = TextEditingController();
  TextEditingController? monyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          " اضافه حاله",
          style: TextStyle(
            color: const Color.fromRGBO(145, 104, 58, 1),
            fontSize: width / 11,
            fontFamily: "BlakaHollow",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: height / 70,
          ),
          Text(
            " تسجيل بيانات الحاله",
            style: TextStyle(
              color: const Color.fromRGBO(145, 104, 58, 1),
              fontSize: width / 12,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: height / 70,
          ),
          Form(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFielld(
                    editingController: nameController,
                    hintText: "الاسم",
                    icon: Icons.person,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFielld(
                    editingController: addressController,
                    hintText: "العنوان",
                    icon: Icons.location_city,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFielld(
                    editingController: declarationController,
                    hintText: "الوصف",
                    icon: Icons.info,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFielld(
                    editingController: monyController,
                    hintText: "الاموال المطلوبه",
                    icon: Icons.money,
                    suffixIcon: null,
                    validatorfun: (value) {
                      if (value!.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.number,
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
                                fontSize: width / 15,
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
                                fontSize: width / 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                BlocBuilder<TabraCubit, TabraState>(
                  builder: (context, state) {
                    return TabraTile(
                        data: "صدقات", tabraType: TabraType.Sadakat);
                  },
                ),
                BlocBuilder<TabraCubit, TabraState>(
                  builder: (context, state) {
                    return TabraTile(
                        data: "كفارات", tabraType: TabraType.Kafarat);
                  },
                ),
                BlocBuilder<TabraCubit, TabraState>(
                  builder: (context, state) {
                    return TabraTile(data: "اضاحي", tabraType: TabraType.Adahi);
                  },
                ),
                SizedBox(
                  height: height / 50,
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
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromRGBO(145, 104, 58, 1))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      " تسجيل الان",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width / 19,
                          fontFamily: "Cairo"),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
