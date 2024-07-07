import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/businessLogic/cubit/cubit/cubit/booked_cases_cubit.dart';
import 'package:graduation/presentation/Screens/PayScreen.dart';

class BookedCase extends StatelessWidget {
  const BookedCase({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<BookedCasesCubit, BookedCasesState>(
      builder: (context, state) {
        return BlocBuilder<BookedCasesCubit, BookedCasesState>(
          builder: (context, state) {
            return BlocBuilder<BookedCasesCubit, BookedCasesState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: height / 1.5,
                      child: ListView.builder(
                          itemCount: BlocProvider.of<BookedCasesCubit>(context)
                              .bookedCase
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 18,
                                shadowColor:
                                    const Color.fromARGB(255, 246, 220, 189),
                                color: const Color.fromRGBO(221, 221, 221, 1),
                                child: ListTile(
                                  trailing: IconButton(
                                    onPressed: () {
                                     
                                      BlocProvider.of<BookedCasesCubit>(context)
                                          .DeleteCase(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  title: Center(
                                    child: Text(
                                      BlocProvider.of<BookedCasesCubit>(context)
                                          .bookedCase[index]["title"]
                                          .toString(),
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(145, 104, 58, 1),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Cairo"),
                                    ),
                                  ),
                                  leading: Text(
                                      "${BlocProvider.of<BookedCasesCubit>(context).bookedCase[index]["sallery"].toString()} جنيه"),
                                ),
                              ),
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocBuilder<BookedCasesCubit, BookedCasesState>(
                          builder: (context, state) {
                            return Text(
                              BlocProvider.of<BookedCasesCubit>(context)
                                  .totalSallary
                                  .toString(),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.color,
                                fontSize: width / 16,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: width / 30,
                        ),
                        Text(
                          ": المبلغ الكلي",
                          style: TextStyle(
                            color: const Color.fromRGBO(145, 104, 58, 1),
                            fontSize: width / 16,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: width / 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PayScreen()),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              const Color.fromRGBO(145, 104, 58, 1))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          " الدفع الان",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width / 19,
                              fontFamily: "Cairo"),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
