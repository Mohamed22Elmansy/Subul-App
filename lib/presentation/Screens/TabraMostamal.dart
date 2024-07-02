import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/pick_image_cubit.dart';
import 'package:graduation/presentation/Widgets/Dialog.dart';
import 'package:graduation/presentation/Widgets/PichImageDialog.dart';
import 'package:image_picker/image_picker.dart';

import '../Widgets/TextField.dart';

class Mostamal extends StatelessWidget {
  Mostamal({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? charityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "تبرع بالمستعمل",
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
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              "assets/images/تبرع بالمستعمل.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          Text(
            "التبرع بالحاجات المستعمله",
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
            key: formKey,
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
                          return "بريدك غير صالح  ";
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
                          return "بريدك غير صالح  ";
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
                      editingController: phoneController,
                      hintText: "التليفون",
                      icon: Icons.phone,
                      suffixIcon: null,
                      validatorfun: (value) {
                        if (value!.isEmpty) {
                          return;
                        }
                        return null;
                      },
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFielld(
                      editingController: charityController,
                      hintText: "اسم الحاجه المستعمله",
                      icon: Icons.group_work,
                      suffixIcon: null,
                      validatorfun: (value) {
                        if (value!.isEmpty) {
                          return;
                        }
                        return null;
                      },
                      obscureText: false,
                      keyboardType: TextInputType.name,
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
                                      .then(
                                          (val) => Navigator.of(context).pop());
                                }, onPressedGallery: () {
                                  BlocProvider.of<PickImageCubit>(context)
                                      .pickImage(ImageSource.gallery)
                                      .then(
                                          (val) => Navigator.of(context).pop());
                                });
                              });
                        },
                        child: Container(
                          width: width / 4,
                          height: width / 4,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(145, 104, 58, 1),
                              shape: BoxShape.circle),
                          child:
                              BlocProvider.of<PickImageCubit>(context).image !=
                                      null
                                  ? Image.file(
                                      BlocProvider.of<PickImageCubit>(context)
                                          .image!,
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
                    height: height / 70,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromRGBO(145, 104, 58, 1))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        " الابلاغ الان",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
