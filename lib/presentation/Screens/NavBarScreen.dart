import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/home_page_cubit.dart';
import '../Widgets/NavBar.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Scaffold(
          
          body: BlocProvider.of<HomePageCubit>(context).activePage,
          bottomNavigationBar: NavBar(
            onTap: BlocProvider.of<HomePageCubit>(context).selectPage,
          ),
        );
      },
    );
  }
}
