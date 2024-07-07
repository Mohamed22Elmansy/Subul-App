import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/presentation/Widgets/TextField.dart';

import '../../businessLogic/cubit/cubit/cubit/booked_cases_cubit.dart';

class PayScreen extends StatelessWidget {
  PayScreen({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? cardNumberController = TextEditingController();
  TextEditingController? cvcController = TextEditingController();
  TextEditingController? expireDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "صفحه الدفع",
          style: TextStyle(
            color: const Color.fromRGBO(145, 104, 58, 1),
            fontSize: width / 11,
            fontFamily: "BlakaHollow",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Form(
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
                  editingController: addressController,
                  hintText: "رقم التليفون",
                  icon: Icons.phone,
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: TextFielld(
                  editingController: addressController,
                  hintText: "بريدك الالكتروني",
                  icon: Icons.email,
                  suffixIcon: null,
                  validatorfun: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: TextFielld(
                  editingController: cardNumberController,
                  hintText: "رقم البطاقه",
                  icon: Icons.branding_watermark,
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: TextFielld(
                  editingController: cvcController,
                  hintText: "CVC",
                  icon: Icons.closed_caption,
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: TextFielld(
                  editingController: expireDateController,
                  hintText: "تاريخ الانتهاء",
                  icon: Icons.calendar_month,
                  suffixIcon: null,
                  validatorfun: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  obscureText: false,
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<BookedCasesCubit, BookedCasesState>(
                    builder: (context, state) {
                      return Text(
                        BlocProvider.of<BookedCasesCubit>(context)
                            .totalSallary
                            .toString(),
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.displayLarge?.color,
                          fontSize: width / 16,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  Text(
                    ": المبلغ ",
                    style: TextStyle(
                      color: const Color.fromRGBO(145, 104, 58, 1),
                      fontSize: width / 16,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                ],
              ),
              SizedBox(
                height: height / 60,
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
                    "تاكيد الطلب",
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
    );
  }
}
