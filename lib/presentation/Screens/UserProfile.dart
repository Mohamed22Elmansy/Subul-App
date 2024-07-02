import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';
import 'package:graduation/data/server/diohellper.dart';
import 'package:graduation/presentation/Widgets/ProfileTile.dart';
import 'package:graduation/presentation/Widgets/TextField.dart';
import 'package:graduation/presentation/Widgets/VerifiyAccount.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  TextEditingController verifiyEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "الصفحه الشخصيه",
          style: TextStyle(
            fontFamily: 'BlakaHollow',
            color: const Color.fromRGBO(145, 104, 58, 1),
            fontSize: width / 8,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width,
              ),
              SizedBox(
                height: height / 5,
                width: height / 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: const Image(
                    image: AssetImage(
                      'assets/images/sopol.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: height / 60,
              ),
              BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
                  return Text(
                    BlocProvider.of<UserProfileCubit>(context).userName,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.displayLarge?.color,
                      fontFamily: "Cairo",
                      fontSize: width / 14,
                    ),
                  );
                },
              ),
              BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
                  return Text(
                    BlocProvider.of<UserProfileCubit>(context).email,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.displayLarge?.color,
                      fontFamily: "Cairo",
                      fontSize: width / 26,
                    ),
                  );
                },
              ),
              SizedBox(
                height: height / 60,
              ),
              SizedBox(
                width: width / 2.5,
                child: ElevatedButton(
                  onPressed: () {
                    /* Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const UpdateProfile();
                      },
                    ));*/
                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromRGBO(145, 104, 58, 1)),
                  child: Text(
                    "تعديـل",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width / 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              const Divider(),
              SizedBox(
                height: height / 60,
              ),
              ProfileTile(
                  icon: Icons.settings, onTap: () {}, title: "الاعدادات"),
              BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
                  // في مشكله ف التفعيل مبيتصلش بالسيرفر
                  return BlocProvider.of<UserProfileCubit>(context).isVerified
                      ? const SizedBox()
                      : ProfileTile(
                          icon: Icons.verified_user,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => VerifyAccount(
                                    height: height,
                                    width: width,
                                    verifiyEmailController:
                                        verifiyEmailController));
                          },
                          title: "تفعيل الحساب");
                },
              ),
              ProfileTile(
                  icon: Icons.wallet, onTap: () {}, title: "معلومات الفواتير"),
              ProfileTile(
                  icon: Icons.verified_user,
                  onTap: () {},
                  title: "إداره المستخدم"),
              const Divider(),
              SizedBox(
                height: height / 50,
              ),
              ProfileTile(icon: Icons.info, onTap: () {}, title: "معلومات"),
              ProfileTile(
                  icon: Icons.logout,
                  onTap: () {
                    BlocProvider.of<UserProfileCubit>(context).logOut(context);
                  },
                  title: "تسجيل الخروج"),
            ],
          ),
        ),
      ),
    );
  }
}
