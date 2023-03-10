import 'package:drug_store/constants/constant.dart';
import 'package:drug_store/view/search_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // routes: {
    //   "/package:drug_store/view/home_page.dart": (context) => const HomePage(),
    // },
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primaryColor: Style.blueColor,
    ),
    home: const SearchView(),
  ));
}
