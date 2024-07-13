import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/user_profile_cubit.dart';
import 'package:graduation/presentation/Widgets/TabraHalatCard.dart';

import '../../businessLogic/cubit/cubit/cubit/booked_cases_cubit.dart';

class AllCasesWidget extends StatelessWidget {
  const AllCasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double hight = MediaQuery.of(context).size.height;
    if (UserProfileCubit.casses == null) {
      return SizedBox();
    } else {
      return SizedBox(
        height: hight / 2,
        child: ListView.builder(
            itemCount: UserProfileCubit.casses!.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabraHalatCard(
                  total: "4500",
                  amount: "200",
                  caseId: UserProfileCubit.casses![index]["caseId"],
                  charityId: UserProfileCubit.casses![index]["charityId"],
                  describtion: UserProfileCubit.casses![index]["description"],
                  title: UserProfileCubit.casses![index]["title"],
                  bookfun: () {
                    BlocProvider.of<BookedCasesCubit>(context)
                        .addCase(title: "ملابس مستعمله", sallary: 1500);
                  },
                ),
              );
            }),
      );
    }
  }
}
