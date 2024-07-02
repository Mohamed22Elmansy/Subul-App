import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businessLogic/cubit/cubit/tabra_cubit.dart';

class TabraTile extends StatelessWidget {
  TabraTile({super.key , required this.data , required this.tabraType});
  TabraType tabraType;
  String data;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: RadioListTile(
        fillColor: WidgetStateProperty.all(
          const Color.fromRGBO(145, 104, 58, 1),
        ),
        title: Text(
          data,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.displayLarge?.fontFamily,
            color: Theme.of(context).textTheme.displayLarge?.color,
            fontSize: width / 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        value: tabraType,
        groupValue: BlocProvider.of<TabraCubit>(context).tabraType,
        onChanged: (value) {
          BlocProvider.of<TabraCubit>(context).tebraType(value);
        },
      ),
    );
  }
}
