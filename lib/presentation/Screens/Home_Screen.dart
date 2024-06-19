import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/presentation/Theme/app_theme.dart';
import 'package:graduation/presentation/Theme/bloc/theme_bloc.dart';
import 'package:graduation/presentation/Widgets/SearchBar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (state is LoadedThemeState) {
                    context.read<ThemeBloc>().add(ThemeChangeEvent(
                        theme: state.themeindex == 0
                            ? AppTheme.darkMode
                            : AppTheme.lightMode));
                  }
                },
                icon: Icon(state is LoadedThemeState && state.themeindex == 1
                    ? Icons.light_mode
                    : Icons.dark_mode),
              );
            },
          )
        ],
        title: Text(
          "سبل",
          style: TextStyle(
            fontFamily: 'BlakaHollow',
            color: const Color.fromRGBO(145, 104, 58, 1),
            fontSize: width / 6,
          ),
        ),
      ),
      body: ListView(
        children: [
          ASearchBar(searchController: searchController, width: width),
        ],
      ),
    );
  }
}
