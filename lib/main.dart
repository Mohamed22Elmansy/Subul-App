import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/cubit/booked_cases_cubit.dart';
import 'package:graduation/businessLogic/cubit/cubit/edit_profile_cubit.dart';
import 'package:graduation/businessLogic/cubit/cubit/pick_image_cubit.dart';
import 'package:graduation/businessLogic/cubit/cubit/tabra_cubit.dart';
import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';
import 'package:graduation/businessLogic/cubit/home_page_cubit.dart';
import 'package:graduation/businessLogic/cubit/regist_cubit.dart';
import 'package:graduation/businessLogic/cubit/reset_password_cubit.dart';
import 'package:graduation/presentation/Screens/PayScreen.dart';
import 'package:graduation/presentation/Screens/Splash_Screen.dart';

import 'package:graduation/presentation/Theme/bloc/theme_bloc.dart';

import 'businessLogic/cubit/login_page_cubit.dart';

import 'data/server/diohellper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
              create: (context) => ThemeBloc()..add(GetCurrentThemeEvent())),
          BlocProvider<LoginPageCubit>(create: (context) => LoginPageCubit()),
          BlocProvider<RegistCubit>(create: (context) => RegistCubit()),
          BlocProvider<HomePageCubit>(create: (context) => HomePageCubit()),
          BlocProvider<PickImageCubit>(create: (context) => PickImageCubit()),
          BlocProvider<EditProfileCubit>(
              create: (context) => EditProfileCubit()),
          BlocProvider<TabraCubit>(create: (context) => TabraCubit()),
          BlocProvider<UserProfileCubit>(
              create: (context) => UserProfileCubit()..checkUser()),
          BlocProvider<ResetPasswordCubit>(
              create: (context) => ResetPasswordCubit()),
          BlocProvider<BookedCasesCubit>(
              create: (context) => BookedCasesCubit()..LoodBookedList()),
        ],//flutter pub run flutter_launcher_icons:main
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is LoadedThemeState) {
              return MaterialApp(
                theme: state.themeData,
                debugShowCheckedModeBanner: false,
                home: const SplashScreen(),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
