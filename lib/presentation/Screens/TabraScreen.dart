import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/tabra_cubit.dart';
import 'package:graduation/presentation/Widgets/tabraTile.dart';

import '../Widgets/TextField.dart';

class Tabra extends StatelessWidget {
  Tabra({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController? moneyController = TextEditingController();

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
          "التبرع",
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
              "assets/images/طريقه التبرع.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          Text(
            "تبرع بالمال",
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
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFielld(
                      editingController: moneyController,
                      hintText: "قيمه التبرع",
                      icon: Icons.money,
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
                      return TabraTile(
                          data: "اضاحي", tabraType: TabraType.Adahi);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){}
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
