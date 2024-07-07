import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/cubit/booked_cases_cubit.dart';
import 'package:graduation/presentation/Widgets/bookedCase.dart';

class AddedCases extends StatelessWidget {
  const AddedCases({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "الحالات المضافه",
          style: TextStyle(
            color: const Color.fromRGBO(145, 104, 58, 1),
            fontSize: width / 11,
            fontFamily: "BlakaHollow",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocProvider.of<BookedCasesCubit>(context).bookedCase.isEmpty
          ? Center(
              child: Text(
                "لا توجد حالات مضافه",
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.displayLarge?.fontFamily,
                  color: Theme.of(context).textTheme.displayLarge?.color,
                  fontSize: width / 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : BookedCase(),
    );
  }
}
