import 'package:flutter/material.dart';

import '../Widgets/TextField.dart';

class PayElzaka extends StatelessWidget {
  PayElzaka({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController? moneyController = TextEditingController();
  TextEditingController? zakaaController = TextEditingController();
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
          "دفع الزكاه",
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
              "assets/images/zakaa.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          Text(
            "حساب قيمه الزكاه",
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
                  // need to edit to be auto calc
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "هذا الحقل مطلوب";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
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
                          hintText: "ادخل قيمه اموالك ",
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
                            Icons.money_outlined,
                            color: Color.fromRGBO(145, 104, 58, 1),
                          ),
                        ),
                        controller: moneyController,
                        onChanged: (value) {
                          if (int.tryParse(value) != null &&
                              int.parse(value) >= 260000) {
                            zakaaController!.text =
                                (int.parse(value) * 0.025).toString();
                          } else if (value.isEmpty) {
                            zakaaController!.text = "";
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFielld(
                      editingController: zakaaController,
                      hintText: "قيمه الزكاه الواجبه",
                      icon: Icons.monitor_rounded,
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
                  SizedBox(
                    height: height / 70,
                  ),
                  Text(
                    "دفع الزكاه",
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
