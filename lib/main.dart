import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/home_page_cubit.dart';
import 'package:graduation/businessLogic/cubit/regist_cubit.dart';
import 'package:graduation/businessLogic/cubit/reset_password_cubit.dart';
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
          BlocProvider<ResetPasswordCubit>(
              create: (context) => ResetPasswordCubit()),
        ],
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
