import 'package:bb_earn_english/pages/on_boarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnBoardingPage();
  }
}
