import 'package:flutter/material.dart';
import '../Widgets/TextField.dart';

class AddPatient extends StatelessWidget {
  AddPatient({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? charityController = TextEditingController();
  TextEditingController? patientNameController = TextEditingController();
  TextEditingController? patientAddressController = TextEditingController();
  TextEditingController? patientStateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "ابلاغ عن حاله",
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
              "assets/images/tips.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          Text(
            " تسجيل بياناتك",
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
                      editingController: phoneController,
                      hintText: "التليفون",
                      icon: Icons.phone,
                      suffixIcon: null,
                      validatorfun: (value) {
                        if (value!.isEmpty) {
                          return "هذا الحقل مطلوب";
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
                      hintText: "اسم الجمعيه",
                      icon: Icons.group_work,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFielld(
                      editingController: nameController,
                      hintText: "اسم الحاله",
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
                      editingController: nameController,
                      hintText: "عتوان الحاله",
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
                      editingController: nameController,
                      hintText: "تفاصيل الحاله",
                      icon: Icons.details,
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
                    height: height / 70,
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
