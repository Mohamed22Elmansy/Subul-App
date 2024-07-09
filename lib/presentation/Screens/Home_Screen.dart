
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/cubit/booked_cases_cubit.dart';
import 'package:graduation/presentation/Theme/app_theme.dart';
import 'package:graduation/presentation/Theme/bloc/theme_bloc.dart';
import 'package:graduation/presentation/Widgets/BottomSheetWidget.dart';
import 'package:graduation/presentation/Widgets/SearchBar.dart';
import 'package:graduation/presentation/Widgets/TabraHalatCard.dart';
import '../Widgets/Drawer.dart';
import '../Widgets/hamalatCard.dart';
import 'PayZakaScreen.dart';
import 'TabraScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const AppDrawer(),
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
          Text(
            "الحالات السريعه",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabraHalatCard(
                    bookfun: () {
                      BlocProvider.of<BookedCasesCubit>(context)
                          .addCase(title: "ملابس مستعمله", sallary: 1500);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabraHalatCard(
                    bookfun: () {
                      BlocProvider.of<BookedCasesCubit>(context)
                          .addCase(title: "بوتاجازات مستعمله", sallary: 2000);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabraHalatCard(
                    bookfun: () {
                      BlocProvider.of<BookedCasesCubit>(context)
                          .addCase(title: "ثلاجات مستعمله", sallary: 3500);
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(
            "الحملات",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HamalatCard(
                    bookfun: () {
                      BlocProvider.of<BookedCasesCubit>(context)
                          .addCase(title: "غذاء للجميع", sallary: 1500);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HamalatCard(
                    bookfun: () {
                      BlocProvider.of<BookedCasesCubit>(context)
                          .addCase(title: "غذاء للجميع", sallary: 3500);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HamalatCard(
                    bookfun: () {
                      BlocProvider.of<BookedCasesCubit>(context)
                          .addCase(title: "غذاء للجميع", sallary: 5000);
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(
            "فرص التبرع",
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
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PayElzaka()),
                    );
                  },
                  child: Card(
                    child: Image.asset(
                      "assets/images/ZakaImage.png",
                      fit: BoxFit.cover,
                      scale: width / 150,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Tabra()),
                    );
                  },
                  child: Card(
                    child: Image.asset(
                      "assets/images/TabarImage.png",
                      fit: BoxFit.cover,
                      scale: width / 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Tabra()),
                    );
                  },
                  child: Card(
                    child: Image.asset(
                      "assets/images/KafaratImage.png",
                      fit: BoxFit.cover,
                      scale: width / 150,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Tabra()),
                    );
                  },
                  child: Card(
                    child: Image.asset(
                      "assets/images/SadakatImage.png",
                      fit: BoxFit.cover,
                      scale: width / 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(
                right: width / 5, left: width / 5, bottom: width / 15),
            child: Image.asset(
              "assets/images/TabaraImage.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            elevation: 5,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: const Color.fromRGBO(145, 104, 58, 1),
            context: context,
            builder: (ctx) => const BottomSheetWidget(),
          );
        },
        backgroundColor: const Color.fromRGBO(145, 104, 58, 1),
        tooltip: "خدمات",
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
