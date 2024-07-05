import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/edit_profile_cubit.dart';

import '../Widgets/TextField.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "تعديل بياناتك",
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
          Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "الاسم",
                    style: TextStyle(
                      color: const Color.fromRGBO(145, 104, 58, 1),
                      fontSize: width / 16,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFielld(
                      editingController:
                          BlocProvider.of<EditProfileCubit>(context)
                              .nameController,
                      hintText: "الاسم",
                      icon: Icons.person,
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
                  Text(
                    "رقم التليفون",
                    style: TextStyle(
                      color: const Color.fromRGBO(145, 104, 58, 1),
                      fontSize: width / 16,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFielld(
                      editingController:
                          BlocProvider.of<EditProfileCubit>(context)
                              .phoneController,
                      hintText: "رقم التليفون",
                      icon: Icons.phone,
                      suffixIcon: null,
                      validatorfun: (value) {
                        if (value!.isEmpty) {
                          return;
                        }
                        return null;
                      },
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text(
                    "المدينه",
                    style: TextStyle(
                      color: const Color.fromRGBO(145, 104, 58, 1),
                      fontSize: width / 16,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFielld(
                      editingController:
                          BlocProvider.of<EditProfileCubit>(context)
                              .cityController,
                      hintText: "المدينه",
                      icon: Icons.location_city,
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
                  Text(
                    "البريد الالكتروني",
                    style: TextStyle(
                      color: const Color.fromRGBO(145, 104, 58, 1),
                      fontSize: width / 16,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFielld(
                      editingController:
                          BlocProvider.of<EditProfileCubit>(context)
                              .emailController,
                      hintText: "البريد الالكتروني",
                      icon: Icons.email,
                      suffixIcon: null,
                      validatorfun: (value) {
                        if (value!.isEmpty) {
                          return;
                        }
                        return null;
                      },
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  BlocBuilder<EditProfileCubit, EditProfileState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<EditProfileCubit>(context)
                                .EditProfile();
                          },
                          style: ElevatedButton.styleFrom(
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                              backgroundColor:
                                  const Color.fromRGBO(145, 104, 58, 1)),
                          child: Text(
                            BlocProvider.of<EditProfileCubit>(context)
                                .buttonLable,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width / 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
