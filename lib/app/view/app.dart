import 'package:flutter/material.dart';
import 'package:pizza/modules/birinchi_page/view/birinchi_view.dart';
import 'package:pizza/modules/category_page/category_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CategoryPage(),
      //  home: BirinchiView(),
    );
  }
}
