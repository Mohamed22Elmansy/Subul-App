import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class ASearchBar extends StatelessWidget {
  ASearchBar({super.key, required this.searchController, required this.width});

  double width;
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimSearchBar(
        color: const Color.fromRGBO(145, 104, 58, 1),
        textFieldColor: Theme.of(context).scaffoldBackgroundColor,
        suffixIcon: const Icon(Icons.search_off),
        textFieldIconColor: const Color.fromRGBO(145, 104, 58, 1),
        searchIconColor: Colors.white,
        style: TextStyle(
          color: Colors.blue,
          fontSize: width / 20,
        ),
        helpText: "     Search.... ",
        width: width,
        autoFocus: true,
        closeSearchOnSuffixTap: true,
        animationDurationInMilli: 700,
        rtl: true,
        textController: searchController,
        onSuffixTap: () {},
        onSubmitted: (r) => r,
      ),
    );
  }
}
